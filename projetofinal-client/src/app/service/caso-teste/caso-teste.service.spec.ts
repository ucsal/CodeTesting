import { TestBed } from '@angular/core/testing';

import { CasoTesteService } from './caso-teste.service';

describe('CasoTesteService', () => {
  let service: CasoTesteService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CasoTesteService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
