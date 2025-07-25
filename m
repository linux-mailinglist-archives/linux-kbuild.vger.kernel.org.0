Return-Path: <linux-kbuild+bounces-8177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 846D4B120F3
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 17:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7394D545215
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 15:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE81E2E54BB;
	Fri, 25 Jul 2025 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ypyytbRu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6A2EF284
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457273; cv=none; b=WnNkDUXcHG5hszT3nZLCbTQ56Qxj2vZcFVt0Vfv5SGckH06HafEsCuGnPMTus/fjjttn+J6sjjWztZeEdlcYvbip6oYrR+sf8geqjSr9HQjOcf5Kac7jdYr0pcPfv7/pa23CwSD89s/vVW2k82u3mWhMxWPACNTbSMx/MhkALZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457273; c=relaxed/simple;
	bh=qHHRDqKCIypk5v8SMgVuwGgQI5uVL5DFcbylQ6k7pPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6LhzP+Qo86ZVM9UEk8STIEQRKthMl7C1dmEN6d0UcLYcgU7twEQ/JhGmOhWP1kr6aNtSro1yGJOT3h7kstoCpZwzQRWeFiBrTAIoQfJ7UUFzf66Fsmz23le8SbMD9XnDkU3XXCL4bu2/FBLOvssjElyRWb0xS+3wH4JXLXk8rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ypyytbRu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e389599fso223585ad.0
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753457271; x=1754062071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYghJYglv5xycj6lEIeN8UVfDvdCip7qw6RMPEir5D4=;
        b=ypyytbRurIVozhfbBo8qAdoHXn/a+WU06h/Pm8LnByJs3j3xbrf7nsLLScdrGQ4z0Y
         WKYIhZd9tXgzszbalbwFtNUux/KCgJy/Eybuhrq6cYMUxntlSkJQa5Gd/Ze8FXUauKUo
         AUmyHBk5qSePA2R4bASLhNGd+D/IBVbBs9SYy+TR/okLiO43us94aX/SFYYCfeFdtOHB
         2bceUXH2LU8/zLYDDV+fFs2PXoXDxEMYgo6vIEyyGbFgoQaeAU+rB6x1M1nEnSat5QzT
         5Y2mP+8tqjnC6WkPu2/lDj4km7rrHc8p38KOxyvrzwg5rALOAuoWug9LUuUoQPFVGKJt
         9Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753457271; x=1754062071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYghJYglv5xycj6lEIeN8UVfDvdCip7qw6RMPEir5D4=;
        b=KB0Bwq3oCcztnwb4qA1hYnSJSCHmjlbRK5ov57ufaOVwRy+l+GD4b0ai9aEtGf2+GF
         tvoAZbVV7XcF2z+Fe8CMcHDqYH/zyJvF3BIEJskvoDEmlbmU68eQjs0i6lnsoP4PNZno
         kfs1Rab2Xvk/Ud0FBjfE8BlaFbjY40gOnop1tTQp7g7Kx71CqfFGHrmOLvvsNPEyLjIp
         6rZnIyF6EjdiVOPIY6JqK3+ZE1g7cUxQ4bCmDjn9TTCY/17KPzebrCToqjyAw9MOeRDP
         xwfwOmHEe2L4SlY3zXLkQeekFzwRLE1N0cfSaCwItyma/T01c9WYK6hBBqAbfG3siotu
         /9qw==
X-Forwarded-Encrypted: i=1; AJvYcCXID3OQ4MEOWeU9PJ8H69/b2maU8RusQbaIQNmDB4dQTzwfv/VU0Ch9JJk0PKA+tqH3Hhe9a0OKAcxWHkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQmujFzfmvvL7oxyyWhzxPtahtuJemEkWsQlITJiNYQTV96X5b
	0gsROxefy78gyolwwuBh/bupZ7WheTnPd7z+ieAOpdRwN2WDOeUgiu0nZRn7auGLBQ==
X-Gm-Gg: ASbGncthrSoFo53JLOftPO9XlfMjCA4V6XwRNEuon5L+ATMgYSv7hIIx+27VHNQX81V
	+2O5mJ4qE8N9zm5QRK/PRqzl8tPy0//vVg/JLTMa5zyrTsneGsN/QNXEeHDM1pCJqEAA+UeEDbZ
	1vmqEeS7lwJgPcPWcRNtpanNZ+gdIVj2OdcBmcNHBVmRa/rs2cFPLZTsBp2Lgc0VrumfGTMDlAE
	bIUPQ4LcMdlfi/8wy4SlakutEC7FwtDWLkpDXn/DljeeDjZXIAFvvbomYlHCXgt2U0azm6YEkRW
	s6HprtTk4Bqkom/2moZeCnx858vaigKTnekAybjaTeSAzuiYJprKYb/x0lZ8q0k5lhg2XSZOeQ2
	airsnGBchioHXA4O3Bt8PGFy+AlOdbL1oO0CBGi+ueYlejJ94BZMspRdku0aPbjMZsZOkwXkgUp
	reo85NQg==
X-Google-Smtp-Source: AGHT+IECUS4ICPT72rez061zYucyKAEQSZl/Vqzwhl1r3oHDO13mDG6PFiHjVXy9pYhZCAlwaMGg8w==
X-Received: by 2002:a17:903:1a2b:b0:215:7152:36e4 with SMTP id d9443c01a7336-23fb044e610mr2864835ad.27.1753457271064;
        Fri, 25 Jul 2025 08:27:51 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30ae0bsm225725ad.18.2025.07.25.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:27:50 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:27:45 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
Message-ID: <20250725152745.GA1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>

On Thu, Jul 24, 2025 at 04:36:54PM -0700, Deepak Gupta wrote:
> SYM_* macros are used to define assembly routines. In this patch series,
> re-define those macros in risc-v arch specific include file to include
> a landing pad instruction at the beginning. This is done only when the
> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
> 
> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
> support.

I glanced through the proposed signature based landing pad labeling
scheme, but didn't see any mentions of lpad_hash for labeling assembly
functions. Is there more information somewhere about how this is going
to be implemented?

Sami

