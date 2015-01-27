<?php

class CargaAcademicaController extends BaseController
{
	public function __construct()
	{
		$this->beforeFilter('auth');
	}
	
	/**
	 * Obtener la vista del registro inicial de carga acádemica.
	 * @return [type]
	 */
	public function getRegistro()
	{
		

		// Plan de Estudio: 20101,20092 (2 últimos planes de estudio)
		$planes = PlanEstudio::select('plan') -> orderBy('plan','desc') -> take(2) -> get();
		$numPlanes = count($planes);
		return View::make('ca.registro')->with('numPlanes',$numPlanes);
	}

	public function postUnidades()
	{
		// Cuatrimestral, Semestral
		$periodosPrograma = PeriodoPrograma::select('periodo_pedu','descripcion')->get();

		// Cargar periodos 2010-1, 2010-2
		$periodos = Periodo::select('periodo')->where('fin','>=',date_format(new DateTime("now"),'Y-m-d'))->get();
		
		$codigosPeriodo = array(); // ó []
		// ["20101" => "2010-1"]
		for ($i=0 ; $i < count($periodos) ; $i++)
		{ 
			$codigosPeriodo[] = ["codigo" => $periodos[$i]->periodo,"formato" => Snippets::str_insert("-",$periodos[$i]->periodo,4)];
		}

		// Oblitatoria, optativa
		$tiposCaracter = Caracter::select('caracter','descripcion')->get();
		
		// Matutino, Vespertino, Interturno
		$turnos = Turno::all();

		// 1 - Artes, 2 - Administración
		$numPrograma = Auth::user()->programaedu;
		
		// 0 - Administrador,!0 - Coordinador
		// Obtener nombre en caso de ser coordinador
		$nombrePrograma = "";
		if ($numPrograma != 0) 
		{
			$nombrePrograma = ProgramaEducativo::find($numPrograma);
			$nombrePrograma = $nombrePrograma -> descripcion;
		}
		
		$var_nombre = array("nombrePrograma");

		// Obtener Planes
		$planes = PlanEstudio::select('plan') -> orderBy('plan','desc') -> take(2) -> get();
		$numPlanes = count($planes);
		// 20101 , 20102
		$planWhereIn = [];
		foreach ($planes as $key => $value) {
			array_push($planWhereIn, $planes[$key]->plan);
		}
		

		// Verificar tipo de usuario
		if($numPrograma != 0)
		{

			// Unidades de aprendizaje: 20101 - 11236 - Matemáticas
			$uas = DB::table('p_ua')
					->select('uaprendizaje.plan','p_ua.uaprendizaje','uaprendizaje.descripcionmat')
					->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
					->where('p_ua.caracter','=',1)
					->where('p_ua.programaedu','=',$numPrograma)
					->whereIn('uaprendizaje.plan',$planWhereIn)
					->orderBy('plan','desc')
					->orderBy('p_ua.uaprendizaje','asc')
					->get();
			
			
			
			// $unidades[0][0] = $uas[0]  -> 20101
			// $unidades[0][1] = $uas[1]  -> 20101
			// $unidades[1][0] = $uas[3]  -> 20102
			
			$unidades  = [];
			foreach ($uas as $key => $value) 
			{
				$nombrePlan = $uas[$key]->plan;
				if($nombrePlan == $planes[0]->plan)
				{
					$unidades[$nombrePlan][] = $uas[$key];
				}

				if($numPlanes > 1)
				{
					if ($nombrePlan == $planes[1]->plan) 
					{
						$unidades[$nombrePlan][] = $uas[$key];
					}
				}
			}
			// Catalogos y unidades de aprendizaje de los planes de estudio.
			$data = compact('periodosPrograma','codigosPeriodo','tiposCaracter','turnos',$var_nombre,'unidades','planes');

			return Response::json($data);
		}
		else
		{
			// Carreras de los planes de estudio
			$programas = DB::table("plan_programa")
					->join("programaedu","plan_programa.programaedu","=","programaedu.programaedu")
					->select("plan_programa.programaedu","programaedu.descripcion")
					->where("plan_programa.programaedu","<>",6)
					->whereIn("plan_programa.plan",$planWhereIn)
					->distinct()
					->get();
			// Catalogos y programas educativos
			$data = compact('periodosPrograma','codigosPeriodo','tiposCaracter','turnos','programas');
			return Response::json($data);
		}
	}
	
	public function getConsulta()
	{
		/**
	 	* Función para integrar el guión en el código del plan de estudio 2009-2
		 * @param  string $string_add    La cadena a agregar
		 * @param  string $string_target La cadena donde se va a agregar el string
		 * @param  int $offset        Puntero donde corta la caden
		 * @return string                Regresa la cadena concatenada
		 */
		function str_insert($string_add,$string_target,$offset)
		{
			$part1 = substr($string_target,0, $offset);
			$part2 = substr($string_target, $offset);

			return $part1.$string_add.$part2;
		}

		// Cargar periodos 2010-1, 2010-2
		$periodos = Periodo::select('periodo')->where('fin','>=',date_format(new DateTime("now"),'Y-m-d'))->get();
		$codigosPeriodo = array();
		for ($i=0; $i < count($periodos); $i++) { 
			$codigosPeriodo[] = ["codigo" => $periodos[$i]->periodo,"formato" => str_insert("-",$periodos[$i]->periodo,4)];
		}

		// Carreras de los planes de estudio: ARTES, CONTADURIA, INFORMATICA, ETC.
		$programas = ProgramaEducativo::where('programaedu','<>','6')->get();

		// Matutino, Vespertino, Interturno
		$turnos = Turno::all();

		return View::make("ca.consulta")->with(compact('codigosPeriodo','programas','turnos'));
	}


	public function getRegistro3()
	{
		
		

	}

	// Altas a tablas principales
	public function postRegistrarperiodo()
	{
		$lapso = new Periodo;
		$p = Input::get('periodoAnio').Input::get('periodoLapso');
		$lapso -> periodo = $p;
		$lapso -> periodo_pedu = Input::get('periodoTipo');
		$lapso -> year = Input::get('periodoAnio');
		$lapso -> mes = Input::get('periodoLapso');
		$lapso -> descripcion = Input::get('periodoDescripcion');
		$lapso -> inicio = Input::get('periodoFechaInicio');
		$lapso -> fin = Input::get('periodoFechaFin');
		$lapso -> users_id = Input::get('periodoUsersId');
		

		$lapso -> save();

		return $lapso;
	}

	public function postRegistrargrupo()
	{
		$grupo = Input::get('grupo_carrera').Input::get('grupo_semestre').Input::get('grupo_identificador');
		$periodo = Input::get('grupo_periodo');
		$plan = Input::get('grupo_plan');
		$users_id = Input::get('grupo_usersid');

		$programa = Input::get('grupo_programa');
		$turno = Input::get('grupo_turno');
		DB::table('grupos')->insert(
			array("grupo"=>$grupo,"periodo"=>$periodo,"plan"=>$plan,"programaedu"=>$programa,"turno"=>$turno,"users_id"=>$users_id)
		);

		return $grupo;
	}

	// CONSULTAS A CARGA ACADEMICA
	public function postObtenergrupos()
	{
		$semestre = Input::get('nosemestre');
		$plan = Input::get('noplan');
		$periodo = Input::get('noperiodo');
		$programa = Input::get('noprograma');

		$grupos = DB::table('grupos')
					->where('grupo','LIKE',"_".$semestre."_")
					->where('plan','=',$plan)
					->where('periodo','=',$periodo)
					->where('programaedu','=',$programa)
					->get();
		return Response::json($grupos);
	}

	public function postObtenergruposperiodo()
	{
		$programa = Input::get("programa");
		$periodo = Input::get("periodo");
		
		$grupos = DB::table("grupos")
					->where("programaedu","=",$programa)
					->where("periodo","=",$periodo)
					->get();

		return $grupos;
	}

	public function postObteneruas()
	{
		$plan = Input::get('noplan');
		$programa = Input::get('programa');
		$caracter = Input::get('caracter');
		// Traer uas aprendizaje con las de tronco comun
		$UAS = DB::table('p_ua')
				->join('uaprendizaje','p_ua.uaprendizaje','=','uaprendizaje.uaprendizaje')
				->select('p_ua.uaprendizaje','uaprendizaje.descripcionmat')
				->whereIn('p_ua.programaedu',array($programa,6))
				->where('uaprendizaje.plan','=',$plan)
				->where('p_ua.caracter','=',$caracter)
				->orderBy('p_ua.uaprendizaje','asc')
				->get();
		
		$uaformateadas = [];
		
		foreach ($UAS as $ua) {
			$formato = $ua->uaprendizaje." - ".$ua->descripcionmat;
			array_push($uaformateadas, $formato);
		}
		return $uaformateadas;
	}
	
	public function postRegistrarcarga()
	{
		$grupos = Input::get('grupos');
		$uas = Input::get('uas');
		$periodo = Input::get('periodo');
		$programa = Input::get('programa');
		$semestre = Input::get('semestre');
		$users_id = Input::get('usersid');
		foreach ($grupos as $grupo) {
			foreach ($uas as $ua) {
				DB::table('carga')->insert(
					array('grupo' => $grupo,'periodo'=>$periodo,'programaedu'=>$programa,'uaprendizaje'=>$ua,'semestre'=>$semestre,'users_id'=>$users_id)
					);
			}
		}

		
		return "Carga dada de alta con exito!";
	}

	public function postObtenergruposua()
	{
		$uaprendizaje = Input::get('uaprendizaje');
		$semestre = Input::get('semestre');
		$grupos = DB::table('carga')
					->select('grupo')
					->where('uaprendizaje','=',$uaprendizaje)
					->where('grupo','LIKE',"_".$semestre."_")
					->get();
		return Response::json($grupos);
	}

	public function postFormateargruposturnos()
	{
		$grupos = Input::get('grupos');
		//$gruposTurno = new stdClass(); // Clase vacia php para recoger variables.
		$gruposTurno = "";
		// Alternativo al for para ultimo elemento
		$ultimo = end($grupos);

		foreach ($grupos as $grupo) {
			$turno = DB::table('grupos')
						->select('turnos.descripcion')
						->join('turnos','grupos.turno','=','turnos.turno')
						->where('grupos.grupo','=',$grupo)
						->first();
			if($ultimo!=$grupo)
				$gruposTurno .= (string)$grupo." T".substr($turno->descripcion, 0,1).", ";
			else
				$gruposTurno .= (string)$grupo." T".substr($turno->descripcion, 0,1);
		}

		return $gruposTurno;
	}

	public function postEliminaruacarga()
	{
		$uaprendizaje = Input::get("uaprendizaje");
		$periodo = Input::get("periodo");
		$programa = Input::get('programa');
		/*DB::table("carga")
				->where("carga.uaprendizaje","=",$uaprendizaje)
				->where("carga.periodo","=",$periodo)
				->delete();*/
		DB::delete("delete carga from carga inner join grupos on carga.grupo = grupos.grupo where carga.periodo = ? and carga.uaprendizaje = ? and grupos.programaedu = ?",array($periodo,$uaprendizaje,$programa));
		return "Unidad de aprendizaje dada de baja de la carga correctamente!";
	}

	public function postEliminarcarga()
	{
		DB::table("carga")->truncate();
	}

	public function postObtenercarga()
	{
		$periodo = Input::get("periodo");
		$programa = Input::get("programa");

		$uas = DB::table("carga")
						->select('carga.periodo','carga.semestre','carga.uaprendizaje','uaprendizaje.descripcionmat','p_ua.caracter','uaprendizaje.creditos','uaprendizaje.HC','etapas.descripcion as etapa','uaprendizaje.plan','carga.programaedu',DB::raw('GROUP_CONCAT(DISTINCT detalleseriacion.uaprequisito) as series'))
						->join('uaprendizaje','carga.uaprendizaje' , '=' , 'uaprendizaje.uaprendizaje')
						->join('p_ua',function($join){
							$join->on('carga.uaprendizaje','=','p_ua.uaprendizaje')
								->on('carga.programaedu','=','p_ua.programaedu');
  						})
						->join('etapas','p_ua.etapa','=','etapas.etapa')
						->leftjoin('detalleseriacion',function($join){
							$join->on('carga.uaprendizaje','=','detalleseriacion.uaprendizaje')
								->on('carga.programaedu', '=' ,'detalleseriacion.programaedu');
						})
						->groupBy('carga.periodo','carga.semestre','carga.uaprendizaje','uaprendizaje.descripcionmat','p_ua.caracter','uaprendizaje.creditos','uaprendizaje.HC','etapa','uaprendizaje.plan','carga.programaedu')
						->where("carga.periodo","=",$periodo)
						->where("carga.programaedu","=",$programa)
						->get();

		$grupos = DB::table("carga")
						->select("carga.grupo","carga.semestre")
						->distinct()
						->join("grupos","carga.grupo","=","grupos.grupo")
						->where("carga.periodo","=",$periodo)
						->where("grupos.programaedu","=",$programa)
						->get();
		$planSemestres = DB::table("carga")
						->select("carga.semestre","carga.periodo","grupos.plan")
						->join("grupos","carga.grupo","=","grupos.grupo")
						->where("carga.periodo","=",$periodo)
						->where("grupos.programaedu","=",$programa)
						->groupBy("semestre","carga.periodo")
						->get();

		foreach ($grupos as $g) {
			$turno = DB::table('grupos')
						->select('turnos.descripcion')
						->join('turnos','grupos.turno','=','turnos.turno')
						->where('grupos.grupo','=',$g->grupo)
						->first();

			$g->grupo = (string)$g->grupo." T".substr($turno->descripcion, 0,1);
		}

		return Response::json(array('uas' => $uas,'grupos'=> $grupos,'planSemestres'=>$planSemestres));

	}

}