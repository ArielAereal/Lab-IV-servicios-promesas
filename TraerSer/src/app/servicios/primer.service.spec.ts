import { TestBed } from '@angular/core/testing';

import { PrimerService } from './primer.service';

describe('PrimerService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: PrimerService = TestBed.get(PrimerService);
    expect(service).toBeTruthy();
  });
});
