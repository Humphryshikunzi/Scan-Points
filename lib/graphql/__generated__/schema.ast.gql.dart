// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const defer = _i1.DirectiveDefinitionNode(
  name: _i1.NameNode(value: 'defer'),
  args: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'label'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'if'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
  locations: [
    _i1.DirectiveLocation.fragmentSpread,
    _i1.DirectiveLocation.inlineFragment,
  ],
  repeatable: false,
);
const stream = _i1.DirectiveDefinitionNode(
  name: _i1.NameNode(value: 'stream'),
  args: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'label'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'initialCount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: _i1.IntValueNode(value: '0'),
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'if'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
  locations: [_i1.DirectiveLocation.field],
  repeatable: false,
);
const Query = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Query'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'profilePicture'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'allRoleClaims'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfListOfRoleClaimResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleClaimCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleClaimById'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfRoleClaimResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleClaimByRoleId'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'roleId'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfListOfRoleClaimResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roles'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfListOfRoleResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleById'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfRoleResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'rolesCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'allPermissionsForRole'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'roleId'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfPermissionResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'usersInRole'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'roleId'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'SafiriCarUserSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SafiriCarUser'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'users'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'SafiriCarUserSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SafiriCarUser'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'currentUser'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUser'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userRoles'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfUserRolesResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'confirmEmail'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'code'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfString'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'forgotPassword'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ForgotPasswordRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'resetPassword'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ResetPasswordRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'registerUser'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'RegisterRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'toggleUserStatus'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ToggleUserStatusRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'contactInfo'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfListOfContactUs'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'location'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'LocationFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'LocationSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Location'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'requests'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'APIRequestFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'APIRequestSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'APIRequest'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'rides'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'RideFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'RideSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Ride'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'latestRides'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'count'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'RideFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'RideSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Ride'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'ridesCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'ridesLastIndex'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'rideBookings'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'UserRidesFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'UserRidesSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRides'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactions'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'RideTransactionFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'RideTransactionSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideTransaction'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'chats'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'PamrideMessageFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'PamrideMessageSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'PamrideMessage'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'subscriberEmails'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SubscriberEmail'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'downloadFile'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'DownloadRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'FileDownloadResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'cars'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'CarFilterInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'order'),
          directives: [],
          type: _i1.ListTypeNode(
            type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'CarSortInput'),
              isNonNull: true,
            ),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Car'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const Mutation = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Mutation'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'changePassword'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'changePassword'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ChangePasswordRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'passwordResetRequestByPhone'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'forgotPasswordInput'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'PasswordResetRequestByPhoneInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateProfile'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'UpdateProfileRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateProfilePicture'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'imagename'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'username'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'addUserToRole'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userId'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'roleName'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'login'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'TokenRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfTokenResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'accessToken'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'model'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ResfreshTokenRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfTokenResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'logOut'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfBoolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'verifyUserAccount'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userIdToVerifyAccount'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfBoolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateUserRating'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userIdToUpdateRating'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userIdUpdating'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'newRating'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Float'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'ride'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'comment'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfBoolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createFrequentRoute'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'frequentRoute'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'FrequentRouteInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfBoolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'removeFrequentRoute'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'username'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'rideId'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfBoolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'activateUserAccount'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userIdToActivateAccount'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfBoolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'disableUserAccount'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userIdToDisableAccount'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfBoolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'verificationCode'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'phoneNumber'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'email'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createRole'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'RoleRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfString'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateRole'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'RoleRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfString'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'deleteRole'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfString'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updatePermissions'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'PermissionRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfString'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createRoleClaim'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'RoleClaimRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfString'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'deleteRoleClaim'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfString'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateUserRoles'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'UpdateUserRolesRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'confirmEmail'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'code'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResultOfString'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'forgotPassword'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ForgotPasswordRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'resetPassword'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ResetPasswordRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'registerUser'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'RegisterRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateUser'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'UpdateRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateUserPhoneNumber'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'email'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'phonenumber'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateUserDocuments'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name:
                _i1.NameNode(value: 'UpdateIdentificationDocumentRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'toggleUserStatus'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ToggleUserStatusRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'deleteUser'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userName'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'contactUs'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ContactUsRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateFMCToken'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userId'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'fcmToken'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'AppResult'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createARide'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'rideInput'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'CreateRideRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Ride'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'cutCommisionPassengerCancelRide'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'amount'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Float'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'cutCommisionDriverCancelRide'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'amount'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Float'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'cutCommisionAndCostTotalPay'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'amount'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Float'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transact'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'TransactRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'LipaNaMpesaResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'lNMPesaStatus'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'checkoutRequestID'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'LipaNaMpesaOnlineStatusResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactB2C'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'TransactB2CRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'B2CResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'b2CStatus'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'transactionStatusRequest'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'TransactionStatusRequestDtoInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TransactionStatusResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'reverse'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'reverseRequest'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ReverseRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ReverseResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'addChart'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'chartMsg'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ChartDtoInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ChartDto'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'saveEmailSubscribed'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'SubscriberEmailInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SubscriberEmail'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'saveUploadeFile'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'UploadRequestInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'saveFlUploadeFile'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'request'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'UploadRequestFlInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createCar'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'car'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'CarInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Car'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updateCar'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'car'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'CarUpdateDtoInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Car'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'deleteCar'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'licensePlate'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Car'),
        isNonNull: true,
      ),
    ),
  ],
);
const SafiriCarUser = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SafiriCarUser'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'firstName'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'ownedCars'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Car'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'lastName'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nationalId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'profilePictureDataUrl'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'referalCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'identificationDocument'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IdentificationDocument'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'isActive'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'role'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'totalRating'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'averageRating'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'tripsCreated'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'tripsCompleted'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'tripsCancelled'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'isVerified'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'aboutMe'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'loyaltyPoints'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'location'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Location'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'device'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Device'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'rides'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRides'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userRatings'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRating'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'frequentRoutes'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'FrequentRoute'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userReferals'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SafiriCarUser'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userName'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'emailConfirmed'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumberConfirmed'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'lockoutEnd'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'accessFailedCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
  ],
);
const UserRolesResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRolesResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userRoles'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRoleModel'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    )
  ],
);
const TokenResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'TokenResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'token'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'refreshToken'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userImageURL'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userName'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'refreshTokenExpiryTime'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
  ],
);
const RoleClaimResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RoleClaimResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'type'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'value'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'group'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'selected'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const Car = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Car'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'licensePlate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'color'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'model'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'imageUrl'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'active'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'ownerId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'owner'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUser'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'rides'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Ride'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
    ),
  ],
);
const Subscription = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Subscription'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'onGetMessage'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'PamrideMessage'),
        isNonNull: true,
      ),
    )
  ],
);
const IdentificationDocument = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'IdentificationDocument'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nationalIdFront'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'nationalIdRear'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'drivingLicenceFront'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'drivingLicenceRear'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const DateTime = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'DateTime'),
  directives: [],
);
const Location = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Location'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'town'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'isPopular'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'country'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Country'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const Device = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Device'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'deviceRegToken'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const UserRides = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRides'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'user'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUser'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'rideId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'ride'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Ride'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactions'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideTransaction'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
    ),
  ],
);
const UserRating = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRating'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userThatRate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userToRate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'ratingValue'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'rideId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'levelOfSatisfaction'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'comment'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'dateOfRating'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'timeOfRating'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'dateOfLastUpadte'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'timeOfLastUpdate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'reviewer'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUser'),
        isNonNull: true,
      ),
    ),
  ],
);
const FrequentRoute = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'FrequentRoute'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'origin'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'destination'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'image'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'color'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ColorCustom'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdDate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
  ],
);
const UserRoleModel = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRoleModel'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleName'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleDescription'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'selected'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const Ride = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Ride'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'placeofStart'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'destination'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'driverId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'estimatePrice'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'estimatedDistance'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'numberOfPeople'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'maximumCarryWeight'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'departureDate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'duration'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'status'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'seat'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Seat'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'seatCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'seatCapacity'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'maxTotalPay'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'totalPay'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amountCashedOut'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'departureTime'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'arrivalTime'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'allowedBehDesc'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'exactPickupLocation'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'routeIndex'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'mpesaReceiptNumber'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactionDate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'compensatedFromPassengerCancel'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'driverPaymentTime'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'isRecurring'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'carId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'car'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Car'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'users'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRides'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactions'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideTransaction'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
    ),
  ],
);
const SafiriCarUserFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'firstName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ownedCars'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ListFilterInputTypeOfCarFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'profilePictureDataUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'referalCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'identificationDocument'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IdentificationDocumentFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isDeleted'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deletedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isActive'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'refreshToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'role'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'refreshTokenExpiryTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'totalRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'averageRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDoubleOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCreated'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCompleted'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCancelled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isVerified'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'aboutMe'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'loyaltyPoints'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableSingleOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'location'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'LocationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'device'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DeviceFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rides'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ListFilterInputTypeOfUserRidesFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userRatings'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ListFilterInputTypeOfUserRatingFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'frequentRoutes'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ListFilterInputTypeOfFrequentRouteFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userReferals'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ListFilterInputTypeOfSafiriCarUserFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'normalizedUserName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'normalizedEmail'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'emailConfirmed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'passwordHash'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'securityStamp'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'concurrencyStamp'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumberConfirmed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'twoFactorEnabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lockoutEnd'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOffsetOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lockoutEnabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'accessFailedCount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const SafiriCarUserSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SafiriCarUserSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'firstName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'profilePictureDataUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'referalCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'identificationDocument'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IdentificationDocumentSortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isDeleted'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deletedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isActive'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'refreshToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'role'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'refreshTokenExpiryTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'totalRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'averageRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCreated'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCompleted'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCancelled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isVerified'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'aboutMe'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'loyaltyPoints'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'location'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'LocationSortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'device'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DeviceSortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'normalizedUserName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'normalizedEmail'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'emailConfirmed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'passwordHash'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'securityStamp'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'concurrencyStamp'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumberConfirmed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'twoFactorEnabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lockoutEnd'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lockoutEnabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'accessFailedCount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const LocationFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'LocationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'LocationFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'LocationFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'town'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isPopular'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'country'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CountryFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const LocationSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'LocationSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'town'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isPopular'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'country'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CountrySortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const APIRequestFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'APIRequestFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'APIRequestFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'APIRequestFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'iPAddress'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'uAString'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'languages'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'path'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'statusCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const APIRequestSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'APIRequestSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'iPAddress'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'uAString'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'languages'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'path'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'statusCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const RideFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RideFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'placeofStart'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'destination'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'estimatePrice'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableSingleOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'estimatedDistance'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'numberOfPeople'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'maximumCarryWeight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'departureDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'duration'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'status'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seat'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SeatFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatCount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatCapacity'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'maxTotalPay'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableSingleOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'totalPay'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableSingleOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amountCashedOut'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDecimalOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'departureTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfTimeSpanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'arrivalTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'allowedBehDesc'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactPickupLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'routeIndex'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'mpesaReceiptNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'compensatedFromPassengerCancel'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableSingleOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverPaymentTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isRecurring'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'carId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'car'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CarFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'users'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ListFilterInputTypeOfUserRidesFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactions'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ListFilterInputTypeOfRideTransactionFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const RideSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RideSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'placeofStart'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'destination'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'estimatePrice'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'estimatedDistance'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'numberOfPeople'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'maximumCarryWeight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'departureDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'duration'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'status'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seat'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SeatSortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatCount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatCapacity'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'maxTotalPay'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'totalPay'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amountCashedOut'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'departureTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'arrivalTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'allowedBehDesc'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactPickupLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'routeIndex'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'mpesaReceiptNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'compensatedFromPassengerCancel'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverPaymentTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isRecurring'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'carId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'car'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CarSortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const UserRidesFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRidesFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRidesFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRidesFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ride'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactions'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ListFilterInputTypeOfRideTransactionFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const UserRidesSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRidesSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserSortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ride'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideSortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const RideTransactionFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RideTransactionFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideTransactionFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideTransactionFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableSingleOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isReversed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'status'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'bookedRideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'passengerId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfTimeSpanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'approvedDateTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'conversationID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'originatorConversationID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reversedDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reversedTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reseaonForReversal'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatsStr'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'paymentMethod'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const RideTransactionSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RideTransactionSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isReversed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'status'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'bookedRideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'passengerId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'approvedDateTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'conversationID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'originatorConversationID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reversedDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reversedTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reseaonForReversal'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatsStr'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'paymentMethod'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const PamrideMessageFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PamrideMessageFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'PamrideMessageFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'PamrideMessageFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'from'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'to'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'dateSend'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'message'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'topic'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updatedAt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfTimeSpanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const PamrideMessageSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PamrideMessageSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'from'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'to'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'dateSend'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'message'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'topic'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updated'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updatedAt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const CarFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CarFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'CarFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'CarFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'color'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'model'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'licensePlate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'imageUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'active'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ownerId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'owner'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rides'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ListFilterInputTypeOfRideFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const CarSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CarSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'color'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'model'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'licensePlate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'imageUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'active'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ownerId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'owner'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserSortInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const StringOperationFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'StringOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'StringOperationFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'StringOperationFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'contains'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ncontains'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'startsWith'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nstartsWith'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'endsWith'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nendsWith'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ListFilterInputTypeOfCarFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ListFilterInputTypeOfCarFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'all'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CarFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'none'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CarFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'some'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CarFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'any'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const IdentificationDocumentFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'IdentificationDocumentFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'IdentificationDocumentFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'IdentificationDocumentFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalIdFront'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalIdRear'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'drivingLicenceFront'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'drivingLicenceRear'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableNullableOfDateTimeOperationFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableNullableOfDateTimeOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const BooleanOperationFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'BooleanOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableInt32OperationFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Int'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Int'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableDoubleOperationFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableDoubleOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Float'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Float'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableSingleOperationFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableSingleOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Float'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Float'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const DeviceFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'DeviceFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'DeviceFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'DeviceFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deviceRegToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ListFilterInputTypeOfUserRidesFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ListFilterInputTypeOfUserRidesFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'all'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UserRidesFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'none'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UserRidesFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'some'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UserRidesFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'any'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ListFilterInputTypeOfUserRatingFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ListFilterInputTypeOfUserRatingFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'all'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UserRatingFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'none'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UserRatingFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'some'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UserRatingFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'any'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ListFilterInputTypeOfFrequentRouteFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ListFilterInputTypeOfFrequentRouteFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'all'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'FrequentRouteFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'none'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'FrequentRouteFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'some'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'FrequentRouteFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'any'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ListFilterInputTypeOfSafiriCarUserFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ListFilterInputTypeOfSafiriCarUserFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'all'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'none'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'some'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'any'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableNullableOfDateTimeOffsetOperationFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(
      value: 'ComparableNullableOfDateTimeOffsetOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const SortEnumType = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'SortEnumType'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'ASC'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'DESC'),
      directives: [],
    ),
  ],
);
const IdentificationDocumentSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'IdentificationDocumentSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalIdFront'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalIdRear'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'drivingLicenceFront'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'drivingLicenceRear'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const DeviceSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'DeviceSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deviceRegToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const CountryFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CountryFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'CountryFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'CountryFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'code'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'abbrev'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const CountrySortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CountrySortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'code'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'abbrev'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableDateTimeOperationFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableDateTimeOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'DateTime'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'DateTime'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const SeatFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SeatFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SeatFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SeatFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'frontLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleCentre'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleRight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backCentre'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backRight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableDecimalOperationFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableDecimalOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Decimal'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Decimal'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableNullableOfTimeSpanOperationFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableNullableOfTimeSpanOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'TimeSpan'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'TimeSpan'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableNullableOfInt32OperationFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableNullableOfInt32OperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Int'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Int'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ListFilterInputTypeOfRideTransactionFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ListFilterInputTypeOfRideTransactionFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'all'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideTransactionFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'none'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideTransactionFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'some'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideTransactionFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'any'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const SeatSortInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SeatSortInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'frontLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleCentre'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleRight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backCentre'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backRight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SortEnumType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ListFilterInputTypeOfRideFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ListFilterInputTypeOfRideFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'all'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'none'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'some'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'any'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const UserRatingFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRatingFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRatingFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRatingFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userThatRate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userToRate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ratingValue'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDoubleOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'levelOfSatisfaction'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comment'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'dateOfRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timeOfRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableTimeSpanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'dateOfLastUpadte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timeOfLastUpdate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableTimeSpanOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reviewer'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const FrequentRouteFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'FrequentRouteFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'FrequentRouteFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'FrequentRouteFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'origin'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'destination'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'image'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'color'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ColorCustomFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(
            value: 'ComparableNullableOfDateTimeOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ComparableTimeSpanOperationFilterInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ComparableTimeSpanOperationFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'eq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'neq'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'in'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'TimeSpan'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nin'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'TimeSpan'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'gte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ngte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlt'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nlte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ColorCustomFilterInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ColorCustomFilterInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'and'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'ColorCustomFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'or'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'ColorCustomFilterInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'r'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'g'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'b'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'a'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'StringOperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ComparableInt32OperationFilterInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const AuthorizeDirective = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AuthorizeDirective'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'policy'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roles'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'apply'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ApplyPolicy'),
        isNonNull: true,
      ),
    ),
  ],
);
const APIRequest = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'APIRequest'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'iPAddress'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'uAString'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'languages'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'path'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'statusCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
    ),
  ],
);
const AppResultOfListOfContactUs = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfListOfContactUs'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'ContactUs'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const AppResultOfUserRolesResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfUserRolesResponse'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UserRolesResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const CreateRideRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CreateRideRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'placeofStart'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'destination'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isActive'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'departureDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'duration'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'estimatePrice'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'estimateDistance'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'numberOfPeople'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'maximumCarryWeight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'carId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seat'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SeatInput'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'departureTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'allowedBehDesc'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rideIndex'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactPickupLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isRecurring'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ContactUsRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ContactUsRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'message'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const ToggleUserStatusRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ToggleUserStatusRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'activateUser'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const UpdateIdentificationDocumentRequestInput =
    _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UpdateIdentificationDocumentRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'identificationDocument'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IdentificationDocumentInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updatedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const UpdateRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UpdateRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'firstName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'aboutMe'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'updatedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const RegisterRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RegisterRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'firstName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'password'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'confirmPassword'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'role'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'activateUser'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'autoConfirmEmail'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'identificationDocument'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IdentificationDocumentInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'totalRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'averageRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'referalCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'locationDto'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'LocationDtoInput'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deviceDto'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DeviceDtoInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ResetPasswordRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ResetPasswordRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'password'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'confirmPassword'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'token'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const ForgotPasswordRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ForgotPasswordRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    )
  ],
);
const UpdateUserRolesRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UpdateUserRolesRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userRoles'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRoleModelInput'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const AppResult = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResult'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const RoleClaimRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RoleClaimRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'roleId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'type'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'value'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'group'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'selected'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const PermissionRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PermissionRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'roleId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'roleClaims'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RoleClaimRequestInput'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const RoleRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RoleRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const AppResultOfString = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfString'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const AppResultOfPermissionResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfPermissionResponse'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'PermissionResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const AppResultOfRoleResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfRoleResponse'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RoleResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const AppResultOfListOfRoleResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfListOfRoleResponse'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RoleResponse'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const AppResultOfRoleClaimResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfRoleClaimResponse'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RoleClaimResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const AppResultOfListOfRoleClaimResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfListOfRoleClaimResponse'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RoleClaimResponse'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const FrequentRouteInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'FrequentRouteInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'origin'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'destination'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'image'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'color'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ColorCustomInput'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const AppResultOfBoolean = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfBoolean'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const ResfreshTokenRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ResfreshTokenRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'token'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'refreshToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const TokenRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'TokenRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'password'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const AppResultOfTokenResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'AppResultOfTokenResponse'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'IResult'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TokenResponse'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const UpdateProfileRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UpdateProfileRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'firstName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'identificationDocumentUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const PasswordResetRequestByPhoneInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PasswordResetRequestByPhoneInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'password'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'confirmPassword'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const ChangePasswordRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ChangePasswordRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'password'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'newPassword'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const IResult = _i1.InterfaceTypeDefinitionNode(
  name: _i1.NameNode(value: 'IResult'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'messages'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'succeeded'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const LipaNaMpesaResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'LipaNaMpesaResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseDescription'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'customerMessage'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const TransactRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'TransactRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'callBackUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const LipaNaMpesaOnlineStatusResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'LipaNaMpesaOnlineStatusResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseDescription'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'resultCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'resultDesc'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const B2CResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'B2CResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'conversationID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'originatorConversationID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseDescription'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const TransactB2CRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'TransactB2CRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'callBackUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'occassion'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'remarks'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'queueTimeOutURL'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const TransactionStatusResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'TransactionStatusResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'conversationID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'originatorConversationID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseDescription'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const TransactionStatusRequestDtoInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'TransactionStatusRequestDtoInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'resultURL'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'queueTimeOutURL'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'remarks'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'occasion'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ReverseResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ReverseResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'conversationID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'originatorConversationID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'responseDescription'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const ReverseRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ReverseRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'initiator'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'securityCredential'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'commandID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CommandType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'receiverParty'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'recieverIdentifierType'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'remarks'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'queueTimeOutURL'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'resultURL'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'occassion'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const RideTransaction = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RideTransaction'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'isReversed'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'status'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'bookedRideId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'passengerId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'driverId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactionCode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactionDate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactionTime'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'approvedDateTime'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'transactionID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'conversationID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'originatorConversationID'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'reversedDate'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'reversedTime'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'reseaonForReversal'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'seatsStr'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'paymentMethod'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const ChartDto = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ChartDto'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'from'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'to'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'dateSend'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'message'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'topic'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'deviceRegToken'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const ChartDtoInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ChartDtoInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'from'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'to'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'dateSend'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'message'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'topic'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deviceRegToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const PamrideMessage = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PamrideMessage'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'from'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'to'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'dateSend'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'message'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'topic'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updated'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'updatedAt'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
    ),
  ],
);
const SubscriberEmail = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SubscriberEmail'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'isActive'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
    ),
  ],
);
const SubscriberEmailInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SubscriberEmailInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isActive'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const UploadRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UploadRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'fileName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'extension'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'uploadType'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UploadType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Byte'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const UploadRequestFlInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UploadRequestFlInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'fileName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'extension'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'uploadType'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UploadType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const FileDownloadResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'FileDownloadResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'fileName'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'fileType'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'data'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Byte'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
    ),
  ],
);
const DownloadRequestInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'DownloadRequestInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'fileName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'downloadType'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'UploadType'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const CarInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CarInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'color'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'model'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'licensePlate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'imageUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'active'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ownerId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'owner'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rides'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const CarUpdateDtoInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CarUpdateDtoInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'color'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'model'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'licensePlate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'imageUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'active'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ownerId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const Country = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Country'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'code'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'abbrev'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
  ],
);
const TimeSpan = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'TimeSpan'),
  directives: [],
);
const ColorCustom = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ColorCustom'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'r'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'g'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'b'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'a'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
  ],
);
const Seat = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Seat'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'frontLeft'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'middleLeft'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'middleCentre'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'middleRight'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'backLeft'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'backCentre'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'backRight'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const Decimal = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'Decimal'),
  directives: [],
);
const RideInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RideInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'placeofStart'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'destination'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'estimatePrice'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'estimatedDistance'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'numberOfPeople'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'maximumCarryWeight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'departureDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'duration'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'status'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seat'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SeatInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatCount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatCapacity'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'maxTotalPay'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'totalPay'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amountCashedOut'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Decimal'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'departureTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'arrivalTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'allowedBehDesc'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactPickupLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'routeIndex'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'mpesaReceiptNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'compensatedFromPassengerCancel'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverPaymentTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isRecurring'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'carId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'car'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CarInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'users'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRidesInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactions'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideTransactionInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const SafiriCarUserInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SafiriCarUserInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'firstName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ownedCars'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'CarInput'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'profilePictureDataUrl'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'referalCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'identificationDocument'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'IdentificationDocumentInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isDeleted'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deletedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isActive'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'refreshToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'role'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'refreshTokenExpiryTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'totalRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'averageRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCreated'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCompleted'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'tripsCancelled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isVerified'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'aboutMe'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'loyaltyPoints'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'location'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'LocationInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'device'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DeviceInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rides'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRidesInput'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userRatings'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'UserRatingInput'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'frequentRoutes'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'FrequentRouteInput'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userReferals'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SafiriCarUserInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'normalizedUserName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'normalizedEmail'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'emailConfirmed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'passwordHash'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'securityStamp'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'concurrencyStamp'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumberConfirmed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'twoFactorEnabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lockoutEnd'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lockoutEnabled'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'accessFailedCount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const Byte = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'Byte'),
  directives: [],
);
const UploadType = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'UploadType'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'CAR'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'PROFILE_PICTURE'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'DOCUMENT'),
      directives: [],
    ),
  ],
);
const CommandType = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'CommandType'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'TRANSACTION_REVERSAL'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'SALARY_PAYMENT'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'BUSINESS_PAYMENT'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'PROMOTION_PAYMENT'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'ACCOUNT_BALANCE'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'CUSTOMER_PAY_BILL_ONLINE'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'TRANSACTION_STATUS_QUERY'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'CHECK_IDENTITY'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'BUSINESS_PAY_BILL'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'BUSINESS_BUY_GOODS'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'DISBURSE_FUNDS_TO_BUSINESS'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'BUSINESS_TO_BUSINESS_TRANSFER'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'BUSINESS_TRANSFER_FROM_MMFTO_UTILITY'),
      directives: [],
    ),
  ],
);
const ColorCustomInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ColorCustomInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'r'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'g'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'b'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'a'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const RoleResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RoleResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'description'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
  ],
);
const PermissionResponse = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PermissionResponse'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleId'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleName'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'roleClaims'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RoleClaimResponse'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const UserRoleModelInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRoleModelInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'roleName'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'roleDescription'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'selected'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const DeviceDtoInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'DeviceDtoInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deviceRegToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    )
  ],
);
const LocationDtoInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'LocationDtoInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'town'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'countryDto'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CountryDtoInput'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const IdentificationDocumentInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'IdentificationDocumentInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalIdFront'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'nationalIdRear'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'drivingLicenceFront'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'drivingLicenceRear'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const SeatInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'SeatInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'frontLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleCentre'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'middleRight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backLeft'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backCentre'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'backRight'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ContactUs = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ContactUs'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'email'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'message'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
  ],
);
const ApplyPolicy = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'ApplyPolicy'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'BEFORE_RESOLVER'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'AFTER_RESOLVER'),
      directives: [],
    ),
  ],
);
const CountryDtoInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CountryDtoInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'code'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'abbrev'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const UserRatingInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRatingInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userThatRate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userToRate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ratingValue'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'levelOfSatisfaction'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'comment'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'dateOfRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timeOfRating'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'dateOfLastUpadte'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'timeOfLastUpdate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reviewer'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserInput'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const DeviceInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'DeviceInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'deviceRegToken'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const LocationInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'LocationInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'town'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isPopular'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'country'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'CountryInput'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'createdBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedOn'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'lastModifiedBy'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const RideTransactionInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'RideTransactionInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'phoneNumber'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'amount'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'isReversed'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'status'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'bookedRideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'passengerId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'driverId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionCode'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'merchantRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'checkoutRequestId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'TimeSpan'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'approvedDateTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'DateTime'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactionID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'conversationID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'originatorConversationID'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reversedDate'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reversedTime'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'reseaonForReversal'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seatsStr'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'paymentMethod'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'exactDropOffLocation'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const UserRidesInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'UserRidesInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'userId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'user'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'SafiriCarUserInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'rideId'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'ride'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'RideInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'transactions'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'RideTransactionInput'),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const CountryInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'CountryInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'code'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'abbrev'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const document = _i1.DocumentNode(definitions: [
  defer,
  stream,
  Query,
  Mutation,
  SafiriCarUser,
  UserRolesResponse,
  TokenResponse,
  RoleClaimResponse,
  Car,
  Subscription,
  IdentificationDocument,
  DateTime,
  Location,
  Device,
  UserRides,
  UserRating,
  FrequentRoute,
  UserRoleModel,
  Ride,
  SafiriCarUserFilterInput,
  SafiriCarUserSortInput,
  LocationFilterInput,
  LocationSortInput,
  APIRequestFilterInput,
  APIRequestSortInput,
  RideFilterInput,
  RideSortInput,
  UserRidesFilterInput,
  UserRidesSortInput,
  RideTransactionFilterInput,
  RideTransactionSortInput,
  PamrideMessageFilterInput,
  PamrideMessageSortInput,
  CarFilterInput,
  CarSortInput,
  StringOperationFilterInput,
  ListFilterInputTypeOfCarFilterInput,
  IdentificationDocumentFilterInput,
  ComparableNullableOfDateTimeOperationFilterInput,
  BooleanOperationFilterInput,
  ComparableInt32OperationFilterInput,
  ComparableDoubleOperationFilterInput,
  ComparableSingleOperationFilterInput,
  DeviceFilterInput,
  ListFilterInputTypeOfUserRidesFilterInput,
  ListFilterInputTypeOfUserRatingFilterInput,
  ListFilterInputTypeOfFrequentRouteFilterInput,
  ListFilterInputTypeOfSafiriCarUserFilterInput,
  ComparableNullableOfDateTimeOffsetOperationFilterInput,
  SortEnumType,
  IdentificationDocumentSortInput,
  DeviceSortInput,
  CountryFilterInput,
  CountrySortInput,
  ComparableDateTimeOperationFilterInput,
  SeatFilterInput,
  ComparableDecimalOperationFilterInput,
  ComparableNullableOfTimeSpanOperationFilterInput,
  ComparableNullableOfInt32OperationFilterInput,
  ListFilterInputTypeOfRideTransactionFilterInput,
  SeatSortInput,
  ListFilterInputTypeOfRideFilterInput,
  UserRatingFilterInput,
  FrequentRouteFilterInput,
  ComparableTimeSpanOperationFilterInput,
  ColorCustomFilterInput,
  AuthorizeDirective,
  APIRequest,
  AppResultOfListOfContactUs,
  AppResultOfUserRolesResponse,
  CreateRideRequestInput,
  ContactUsRequestInput,
  ToggleUserStatusRequestInput,
  UpdateIdentificationDocumentRequestInput,
  UpdateRequestInput,
  RegisterRequestInput,
  ResetPasswordRequestInput,
  ForgotPasswordRequestInput,
  UpdateUserRolesRequestInput,
  AppResult,
  RoleClaimRequestInput,
  PermissionRequestInput,
  RoleRequestInput,
  AppResultOfString,
  AppResultOfPermissionResponse,
  AppResultOfRoleResponse,
  AppResultOfListOfRoleResponse,
  AppResultOfRoleClaimResponse,
  AppResultOfListOfRoleClaimResponse,
  FrequentRouteInput,
  AppResultOfBoolean,
  ResfreshTokenRequestInput,
  TokenRequestInput,
  AppResultOfTokenResponse,
  UpdateProfileRequestInput,
  PasswordResetRequestByPhoneInput,
  ChangePasswordRequestInput,
  IResult,
  LipaNaMpesaResponse,
  TransactRequestInput,
  LipaNaMpesaOnlineStatusResponse,
  B2CResponse,
  TransactB2CRequestInput,
  TransactionStatusResponse,
  TransactionStatusRequestDtoInput,
  ReverseResponse,
  ReverseRequestInput,
  RideTransaction,
  ChartDto,
  ChartDtoInput,
  PamrideMessage,
  SubscriberEmail,
  SubscriberEmailInput,
  UploadRequestInput,
  UploadRequestFlInput,
  FileDownloadResponse,
  DownloadRequestInput,
  CarInput,
  CarUpdateDtoInput,
  Country,
  TimeSpan,
  ColorCustom,
  Seat,
  Decimal,
  RideInput,
  SafiriCarUserInput,
  Byte,
  UploadType,
  CommandType,
  ColorCustomInput,
  RoleResponse,
  PermissionResponse,
  UserRoleModelInput,
  DeviceDtoInput,
  LocationDtoInput,
  IdentificationDocumentInput,
  SeatInput,
  ContactUs,
  ApplyPolicy,
  CountryDtoInput,
  UserRatingInput,
  DeviceInput,
  LocationInput,
  RideTransactionInput,
  UserRidesInput,
  CountryInput,
]);
