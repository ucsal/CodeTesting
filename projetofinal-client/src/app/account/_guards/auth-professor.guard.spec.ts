import { TestBed } from '@angular/core/testing';

import { AuthProfessorGuard } from './auth-professor.guard';

describe('AuthProfessorGuard', () => {
  let guard: AuthProfessorGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(AuthProfessorGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
