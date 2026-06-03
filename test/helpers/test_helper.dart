import 'package:flutter_ui_playground/src/auth/data/models/auth_token_model.dart';
import 'package:flutter_ui_playground/src/auth/domain/entities/auth_token.dart';
import 'package:flutter_ui_playground/src/employee/data/models/employee_model.dart';
import 'package:flutter_ui_playground/src/employee/domain/entities/employee.dart';
import 'package:flutter_ui_playground/src/profile/data/models/profile_model.dart';
import 'package:flutter_ui_playground/src/profile/domain/entities/profile.dart';

// ─── Auth ────────────────────────────────────────────────────
const tAuthToken = AuthToken(
  accessToken:  'test_access_token',
  refreshToken: 'test_refresh_token',
  id:           1,
  username:     'emilys',
  email:        'emily.johnson@x.dummyjson.com',
  firstName:    'Emily',
  lastName:     'Johnson',
);

const tAuthTokenModel = AuthTokenModel(
  accessToken:  'test_access_token',
  refreshToken: 'test_refresh_token',
  id:           1,
  username:     'emilys',
  email:        'emily.johnson@x.dummyjson.com',
  firstName:    'Emily',
  lastName:     'Johnson',
);

// ─── Employee ────────────────────────────────────────────────
const tEmployee = Employee(
  id:         1,
  name:       'Emily Johnson',
  email:      'emily.johnson@x.dummyjson.com',
  phone:      '+81 965-431-3024',
  position:   'Software Engineer',
  department: 'Engineering',
  avatarUrl:  'https://dummyjson.com/icon/emilys/128',
  isActive:   true,
);

const tEmployeeList = [tEmployee];

const tEmployeeModel = EmployeeModel(
  id:        1,
  firstName: 'Emily',
  lastName:  'Johnson',
  email:     'emily.johnson@x.dummyjson.com',
  phone:     '+81 965-431-3024',
  image:     'https://dummyjson.com/icon/emilys/128',
  company:   {'title': 'Software Engineer', 'department': 'Engineering'},
);

final tEmployeeModelList = [tEmployeeModel]; // ← pastikan baris ini ada

// ─── Profile ─────────────────────────────────────────────────
const tProfile = Profile(
  id:         1,
  name:       'Emily Johnson',
  email:      'emily.johnson@x.dummyjson.com',
  phone:      '+81 965-431-3024',
  position:   'Software Engineer',
  department: 'Engineering',
  avatarUrl:  'https://dummyjson.com/icon/emilys/128',
);

const tProfileModel = ProfileModel(
  id:        1,
  firstName: 'Emily',
  lastName:  'Johnson',
  email:     'emily.johnson@x.dummyjson.com',
  phone:     '+81 965-431-3024',
  image:     'https://dummyjson.com/icon/emilys/128',
  company:   {'title': 'Software Engineer', 'department': 'Engineering'},
);