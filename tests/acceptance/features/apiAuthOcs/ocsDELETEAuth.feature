@api @files_sharing-app-required
Feature: auth

  Background:
    Given user "another-admin" has been created with default attributes and without skeleton files

  @smokeTest @issue-32068 @skipOnOcis @issue-ocis-reva-30 @issue-ocis-reva-65
  @skipOnBruteForceProtection @issue-brute_force_protection-112
  Scenario: send DELETE requests to OCS endpoints as admin with wrong password
    Given user "another-admin" has been added to group "admin"
    When user "another-admin" requests these endpoints with "DELETE" using password "invalid" about user "Alice"
      | endpoint                                                        |
      | /ocs/v1.php/apps/files_sharing/api/v1/remote_shares/pending/123 |
      | /ocs/v2.php/apps/files_sharing/api/v1/remote_shares/pending/123 |
      | /ocs/v1.php/apps/files_sharing/api/v1/remote_shares/123         |
      | /ocs/v2.php/apps/files_sharing/api/v1/remote_shares/123         |
      | /ocs/v2.php/apps/files_sharing/api/v1/shares/123                |
      | /ocs/v1.php/apps/files_sharing/api/v1/shares/pending/123        |
      | /ocs/v2.php/apps/files_sharing/api/v1/shares/pending/123        |
      | /ocs/v1.php/cloud/apps/testing                                  |
      | /ocs/v2.php/cloud/apps/testing                                  |
      | /ocs/v1.php/cloud/groups/group1                                 |
      | /ocs/v2.php/cloud/groups/group1                                 |
      | /ocs/v1.php/cloud/users/%username%                              |
      | /ocs/v2.php/cloud/users/%username%                              |
      | /ocs/v1.php/cloud/users/%username%/groups                       |
      | /ocs/v2.php/cloud/users/%username%/groups                       |
      | /ocs/v1.php/cloud/users/%username%/subadmins                    |
      | /ocs/v2.php/cloud/users/%username%/subadmins                    |
    Then the HTTP status code of responses on all endpoints should be "401"
    And the OCS status code of responses on all endpoints should be "997"

  @smokeTest @skipOnOcV10 @issue-ocis-reva-30 @issue-ocis-reva-65
   #after fixing all issues delete this Scenario and use the one above
  Scenario: send DELETE requests to OCS endpoints as admin with wrong password
    When the administrator requests these endpoints with "DELETE" using password "invalid" about user "Alice"
      | endpoint                                                        |
      | /ocs/v1.php/apps/files_sharing/api/v1/remote_shares/pending/123 |
      | /ocs/v2.php/apps/files_sharing/api/v1/remote_shares/pending/123 |
      | /ocs/v1.php/apps/files_sharing/api/v1/remote_shares/123         |
      | /ocs/v2.php/apps/files_sharing/api/v1/remote_shares/123         |
      | /ocs/v2.php/apps/files_sharing/api/v1/shares/123                |
      | /ocs/v1.php/apps/files_sharing/api/v1/shares/pending/123        |
      | /ocs/v2.php/apps/files_sharing/api/v1/shares/pending/123        |
      | /ocs/v1.php/cloud/apps/testing                                  |
      | /ocs/v2.php/cloud/apps/testing                                  |
      | /ocs/v1.php/cloud/groups/group1                                 |
      | /ocs/v2.php/cloud/groups/group1                                 |
    Then the HTTP status code of responses on all endpoints should be "401"
    And the OCS status code of responses on all endpoints should be "notset"

  @smokeTest @skipOnOcV10 @issue-ocis-ocs-26
   #after fixing all issues delete this Scenario and use the one above
  Scenario: send DELETE requests to OCS endpoints as admin with wrong password
    When the administrator requests these endpoints with "DELETE" using password "invalid" about user "Alice"
      | endpoint                                                        |
      | /ocs/v1.php/cloud/users/%username%                              |
      | /ocs/v1.php/cloud/users/%username%/subadmins                    |
    Then the HTTP status code of responses on all endpoints should be "200"
    And the OCS status code of responses on all endpoints should be "998"

  @smokeTest @skipOnOcV10 @issue-ocis-ocs-26
   #after fixing all issues delete this Scenario and use the one above
  Scenario: send DELETE requests to OCS endpoints as admin with wrong password
    When the administrator requests these endpoints with "DELETE" using password "invalid" about user "Alice"
      | endpoint                                                        |
      | /ocs/v1.php/cloud/users/%username%/groups                       |
    Then the HTTP status code of responses on all endpoints should be "200"
    And the OCS status code of responses on all endpoints should be "996"

  @smokeTest @skipOnOcV10 @issue-ocis-ocs-26
   #after fixing all issues delete this Scenario and use the one above
  Scenario: send DELETE requests to OCS endpoints as admin with wrong password
    When the administrator requests these endpoints with "DELETE" using password "invalid" about user "Alice"
      | endpoint                                                        |
      | /ocs/v2.php/cloud/users/%username%/groups                       |
    Then the HTTP status code of responses on all endpoints should be "500"
    And the OCS status code of responses on all endpoints should be "996"

  @smokeTest @skipOnOcV10 @issue-ocis-ocs-26
   #after fixing all issues delete this Scenario and use the one above
  Scenario: send DELETE requests to OCS endpoints as admin with wrong password
    When the administrator requests these endpoints with "DELETE" using password "invalid" about user "Alice"
      | endpoint                                                        |
      | /ocs/v2.php/cloud/users/%username%                              |
      | /ocs/v2.php/cloud/users/%username%/subadmins                    |
    Then the HTTP status code of responses on all endpoints should be "404"
    And the OCS status code of responses on all endpoints should be "998"
