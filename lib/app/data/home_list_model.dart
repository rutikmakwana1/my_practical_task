class home_list_model {
  int? totalJobs;
  int? todayOpeningJob;
  List<JobTypes>? jobTypes;
  List<StateWise>? stateWise;
  List<Data>? data;
  int? unreadNotificationCount;
  String? message;
  bool? status;

  home_list_model(
      {this.totalJobs,
        this.todayOpeningJob,
        this.jobTypes,
        this.stateWise,
        this.data,
        this.unreadNotificationCount,
        this.message,
        this.status});

  home_list_model.fromJson(Map<String, dynamic> json) {
    totalJobs = json['total_jobs'];
    todayOpeningJob = json['today_opening_job'];
    if (json['job_types'] != null) {
      jobTypes = <JobTypes>[];
      json['job_types'].forEach((v) {
        jobTypes!.add(new JobTypes.fromJson(v));
      });
    }
    if (json['state_wise'] != null) {
      stateWise = <StateWise>[];
      json['state_wise'].forEach((v) {
        stateWise!.add(new StateWise.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    unreadNotificationCount = json['unread_notification_count'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_jobs'] = this.totalJobs;
    data['today_opening_job'] = this.todayOpeningJob;
    if (this.jobTypes != null) {
      data['job_types'] = this.jobTypes!.map((v) => v.toJson()).toList();
    }
    if (this.stateWise != null) {
      data['state_wise'] = this.stateWise!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['unread_notification_count'] = this.unreadNotificationCount;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class JobTypes {
  int? id;
  String? jobTypeName;

  JobTypes({this.id, this.jobTypeName});

  JobTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTypeName = json['job_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_type_name'] = this.jobTypeName;
    return data;
  }
}

class StateWise {
  String? state;
  String? stateName;
  int? jobs;
  String? stateFlag;

  StateWise({this.state, this.stateName, this.jobs, this.stateFlag});

  StateWise.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    stateName = json['state_name'];
    jobs = json['jobs'];
    stateFlag = json['state_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['state_name'] = this.stateName;
    data['jobs'] = this.jobs;
    data['state_flag'] = this.stateFlag;
    return data;
  }
}

class Data {
  int? id;
  String? jobName;
  String? jobTypeName;
  String? jobLocation;
  String? salary;
  Null? salaryType;
  String? stateName;
  Null? cityName;
  String? createdAt;
  int? favoriteType;

  Data(
      {this.id,
        this.jobName,
        this.jobTypeName,
        this.jobLocation,
        this.salary,
        this.salaryType,
        this.stateName,
        this.cityName,
        this.createdAt,
        this.favoriteType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobName = json['job_name'];
    jobTypeName = json['job_type_name'];
    jobLocation = json['job_location'];
    salary = json['salary'];
    salaryType = json['salary_type'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    createdAt = json['created_at'];
    favoriteType = json['favorite_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_name'] = this.jobName;
    data['job_type_name'] = this.jobTypeName;
    data['job_location'] = this.jobLocation;
    data['salary'] = this.salary;
    data['salary_type'] = this.salaryType;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    data['created_at'] = this.createdAt;
    data['favorite_type'] = this.favoriteType;
    return data;
  }
}

