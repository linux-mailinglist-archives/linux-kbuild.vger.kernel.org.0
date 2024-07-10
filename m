Return-Path: <linux-kbuild+bounces-2447-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3492CB59
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1610AB21362
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7711371747;
	Wed, 10 Jul 2024 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyvC5Sd9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DDA24A08;
	Wed, 10 Jul 2024 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594459; cv=none; b=Ez0eZVo9wtTHboYzEHNzhKMAGTSI2T6jzhDUqpcIPxyWe2SCF06SWkCA06Jm6rb860Fnx8hzWlFGdwTm+vzsygPiPtx4TTJxKuBNmCmUQO4CtgQ8rXCQBLta9Eide1YO1htKIHi3k+eYeCyvzZtTYiNPbSNiqKRLIIQyhWaO2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594459; c=relaxed/simple;
	bh=pjYP4y25RDcgP0zH1/EuAfgZZCwTSHNncA7y1lkzjV8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XxTqkK4M5BaobHGcirhNHXV6mFvFQIqagsdAddRYg9HrcHAZjT+pQzRXildUBjklueaD3WGl4oyxaLH0dlYxWvD5+tOL9zZAyIjUEm4AMN40vXv2HAsQQMbQw5hSXmQub0qal5PfJSWGE2hvLTSU3SnU9pJpxzLNc554wG7UbXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyvC5Sd9; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-595856e2332so1588417a12.1;
        Tue, 09 Jul 2024 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594456; x=1721199256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qCh9lr/6CT2gr3Pq/BvV6O8SufZtSPyjV3cZbBfVTrk=;
        b=iyvC5Sd94sZ4GBzjmkIY7fJygsmBRUUUjHEdE+rrCsPgJe5zQUgUW8KaPc8nTpRD4o
         xjiGa78hoQsqwYNCHJU0/FSdVPfZv1FfkIyi4sNZ3JRnWK0r1pLPPGJnxx+1BgoPahZT
         NyLQEo/inZIIr6i8M8iZLu/UPg/M4ajGuf7xijWAvXpVTKVoUmJvNfHWZooapdeb/oMa
         IcNVql1qQs2Q9RbqmXcr60zQcNvvYHI7epK1LAlvKROUwg9u1gNBcBg36Rnyxv/hI+to
         WeQCsZS48OxHkWJ10j+XIKMT0KRShOsyEhSLC16Px7lFAEWglm+6fit1heyHEtB4eaMq
         RW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594456; x=1721199256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCh9lr/6CT2gr3Pq/BvV6O8SufZtSPyjV3cZbBfVTrk=;
        b=gKmZ//MaPUi0gBHtnoCG2k5GbSINQ+I7lDC6phFI0awE0aqn7CCIX5Jgppj6ZOi8Xu
         9x0HPPf9aaJeLvseHiNDg9h1zMX4dIWkLSPw0/nSKjgb9BaItDt/tULpRyCTYf/lIsAG
         B5U/ArpIUs07o8x0LBqz+X6kGRbhIlw9ZcEWm/mR7JhIjvFPzw4BkKDARA44QvsSSAxk
         uiE/FIkgia4HIulPY4H9gwfv+AsurgPjgk2Q4Y/YI49zyAQ2NARIs3dy8dw2zQqVPSVc
         fyHz9S2WSz78hvoMvcys8+MsWIFMmPa0ZBY8dC7GPClK0UoumIGrDR44SD/V0MXwQebd
         MUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKuwwLTkW/MiavLqlA3mY5sUrxkjHn2EV2PKeVAOPmXwt8bu37Pf7Grd6hlc3PYOiFrbM40DiZxeAC5ZUW1lgt/XQh9+97P4SX9ioq
X-Gm-Message-State: AOJu0YwJGAEae1C8qRMl3szVS9Sh6trnEMmnaKNCr6EvRbyq/WjZDKPE
	UDTO9pDVXBVb4FctPk3UfULr6izXqSSos422ctmVSEjaOWRE46jl5Olq8Q==
X-Google-Smtp-Source: AGHT+IGusW3WZy/Lw3Ek2eKwFbS4PzOokvo8hx4ZoSu/N7ZZkCs/bheldgU/2TnseP4sUZadyG0hqw==
X-Received: by 2002:a05:6402:2742:b0:57c:610a:6e7f with SMTP id 4fb4d7f45d1cf-594baf8719fmr3883007a12.11.1720594455833;
        Tue, 09 Jul 2024 23:54:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:15 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/12] kconfig: Add support for conflict resolution
Date: Wed, 10 Jul 2024 08:52:43 +0200
Message-Id: <20240710065255.10338-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Configuring a kernel requires a forward enabling approach where one
enables each option one needs at a time. If one enables an option
that selects other options, these options are no longer de-selectable
by design. Likewise, if one has enabled an option which creates a
conflict with a secondary option one wishes to enable, one cannot
easily enable that secondary option, unless one is willing to spend
time analyzing the dependencies that led to this conflict. Sometimes,
these conflicts are not easy to understand [0,1].

This patch series (for linux-next) provides support to enable users to
express their desired target configuration and display possible
resolutions to their conflicts. This support is provided within xconfig.

Conflict resolution is provided by translating kconfig's configuration
option tree to a propositional formula, and then allowing our resolution
algorithm, which uses a SAT solver (picosat, implemented in C) calculate
the possible fixes for an expressed target kernel configuration.

New UI extensions are made to xconfig with panes and buttons to allow
users to express new desired target options, calculate fixes, and apply
any of found solutions.

We created a separate test infrastructure that we used to validate the
correctness of the suggestions made. It shows that our resolution
algorithm resolves around 95% of the conflicts. We plan to incorporate
this with a later patch series.

We envision that our translation of the kconfig option tree into a 
propositional formula could potentially also later be repurposed to 
address other problems. An example is checking the consistency between the
use of ifdefs and logic expressed in kconfig files. We suspect that this 
could, for example, help avoid invalid kconfig configurations and help 
with ifdef maintenance.

You can see a YouTube video demonstrating this work [2]. This effort is 
part of the kernelnewbies Kconfig-SAT project [3], the 
approach and effort is also explained in detail in our paper [4]. The 
results from the evaluation have significantly improved since then: Around
80 % of the conflicts could be resolved, and 99.9 % of the generated 
fixes resolved the conflict. It is also our attempt at contributing back 
to the kernel community, whose configurator researchers studied a lot.

Patches applicable to next-20240703.

[0] https://gsd.uwaterloo.ca/sites/default/files/vamos12-survey.pdf
[1] https://www.linux-magazine.com/Issues/2021/244/Kconfig-Deep-Dive
[2] https://www.youtube.com/watch?v=vn2JgK_PTbc
[3] https://kernelnewbies.org/KernelProjects/kconfig-sat
[4] http://www.cse.chalmers.se/~bergert/paper/2021-icseseip-configfix.pdf

Thanks from the team! (and thanks to Luis Chamberlain for guiding us here)

Co-developed-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Patrick Franz <deltaone@debian.org>
Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
Suggested-by: Sarah Nadi <nadi@ualberta.ca>
Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>

Ole Schuerks (12):
  kconfig: Add picosat.h
  kconfig: Add picosat.c (1/3)
  kconfig: Add picosat.c (2/3)
  kconfig: Add picosat.c (3/3)
  kconfig: Add definitions
  kconfig: Add files for building constraints
  kconfig: Add files for handling expressions
  kconfig: Add files for RangeFix
  kconfig: Add files with utility functions
  kconfig: Add tools
  kconfig: Add xconfig-modifications
  kconfig: Add loader.gif

 scripts/kconfig/.gitignore       |    1 +
 scripts/kconfig/Makefile         |   13 +-
 scripts/kconfig/cf_constraints.c | 1720 ++++++
 scripts/kconfig/cf_constraints.h |   26 +
 scripts/kconfig/cf_defs.h        |  287 +
 scripts/kconfig/cf_expr.c        | 2594 +++++++++
 scripts/kconfig/cf_expr.h        |  296 ++
 scripts/kconfig/cf_rangefix.c    | 1066 ++++
 scripts/kconfig/cf_rangefix.h    |   21 +
 scripts/kconfig/cf_utils.c       | 1031 ++++
 scripts/kconfig/cf_utils.h       |  115 +
 scripts/kconfig/cfoutconfig.c    |  142 +
 scripts/kconfig/configfix.c      |  337 ++
 scripts/kconfig/configfix.h      |   40 +
 scripts/kconfig/expr.h           |   17 +
 scripts/kconfig/loader.gif       |  Bin 0 -> 4177 bytes
 scripts/kconfig/picosat.c        | 8502 ++++++++++++++++++++++++++++++
 scripts/kconfig/picosat.h        |  658 +++
 scripts/kconfig/qconf.cc         |  515 +-
 scripts/kconfig/qconf.h          |  103 +
 20 files changed, 17480 insertions(+), 4 deletions(-)
 create mode 100644 scripts/kconfig/cf_constraints.c
 create mode 100644 scripts/kconfig/cf_constraints.h
 create mode 100644 scripts/kconfig/cf_defs.h
 create mode 100644 scripts/kconfig/cf_expr.c
 create mode 100644 scripts/kconfig/cf_expr.h
 create mode 100644 scripts/kconfig/cf_rangefix.c
 create mode 100644 scripts/kconfig/cf_rangefix.h
 create mode 100644 scripts/kconfig/cf_utils.c
 create mode 100644 scripts/kconfig/cf_utils.h
 create mode 100644 scripts/kconfig/cfoutconfig.c
 create mode 100644 scripts/kconfig/configfix.c
 create mode 100644 scripts/kconfig/configfix.h
 create mode 100644 scripts/kconfig/loader.gif
 create mode 100644 scripts/kconfig/picosat.c
 create mode 100644 scripts/kconfig/picosat.h

-- 
2.39.2


