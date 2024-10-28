Return-Path: <linux-kbuild+bounces-4350-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01049B23A0
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 04:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AED70282055
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 03:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD26C189902;
	Mon, 28 Oct 2024 03:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHmN3rU9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EDDA47;
	Mon, 28 Oct 2024 03:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087406; cv=none; b=paDYWmYa9lrX2E9u+ORBTkDmfi2yV+j34o4JQiDDuUCvoeqxAes8gV7BzHw7wqgVcsGNIrrbEk81hDrZSQ2dIDwJsni1v0aq5LEKicjAx77h7hLVSY7oCetQpPgCIOk8MhZG9k5GOxqVcouOWyzVWXFtFd3DssuNNCecBJiL7/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087406; c=relaxed/simple;
	bh=a+/bVA5OPYt/0wbHRkGbWkPFzQrCsldC3LcQYmjyB7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NSdm9OhVd2bqs6/5hqXwWIJWckfyRY5uagM/WJ5FbLDHY5kcJqimNF9u/mdgOxrzUCvKm8Pc3j+686GZa8TocJn2hfu2nJLAkr23wS5zgiJ0Ge1oUgxmDEKGF2lkFMk7hK05o65ubcA+XBsADjJ5da/UNn15TmMwNUKtmGLRHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHmN3rU9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso5319659a12.2;
        Sun, 27 Oct 2024 20:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087402; x=1730692202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P88KmjjfirRRqMU62x0HFd0NEJRjwzIqasHJqPnJnuA=;
        b=LHmN3rU9DCWtvzYsL4350dV7KdyQhMngYqhzPOuKBdb4uR49lnpNardojhYH30bgmG
         ymHoY3oPSJGiRVvNxVXy2bA78cMS7F5PYTduWyqKO60WOWjZvNP1IhIOWg2a0rPmv2ok
         YTNKF5uRRh9kTWRjl0y/koLxPI2HRsL8pvVrbc4AdJJgccIGT0I+eXdwLTYVyHpu3/W5
         8jXbTHxjn5uXWbz9bMaPU/H5tdl1A7esn/aVjcsDhaewBjDqKjKS+KWAY/rUW96LsdeH
         ymvQeFBu3riDZPm0NAivqBcMDBxTnt2XszD29hMNGan6DU/kz+PWmpXiFnJCXSlUwhPq
         qRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087402; x=1730692202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P88KmjjfirRRqMU62x0HFd0NEJRjwzIqasHJqPnJnuA=;
        b=SD99LApltlkwj4vDhaeVeiKxRbeWtumtxUriJMdwupy9TZ1Pm/Kw0SYMOwZ6RdKl3P
         fiLDREusrpUNLlMvNEUeIENt8bqPPzGl7tq7/9y17whG5KxdTsICsIqE0u/qCkuD4haj
         ZUL71AFmvCSjvL4EgMoLHtVZu3M/ShMnRNetJRxun7zwz6WLVFzGeysK7l33xhte3YLU
         eKfPI6+0vqsIEKPIpIlODZNKnUZhBCavyo/p9XomvVbW6Y9rtD9Cg9Ze2nZsb6VW2weR
         6/taFDeMkkN8deiBbfrSHVW4VmBBybk7VytWsgqYVC+ofqrqPaFNGtRycA5gDga+JgDi
         iFbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMsE73zzQew5DOMwF61EBonCattr+hPdgEKjQIciLGHVpI/LC0FUW3r3GPJ2lKwWOSnOPh/3st0pIhsmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYjqOJJm+uSYYq9zbWV+KYbqP4/7x772xRmPRISNyC+cPGjXs
	0yqBtVqO9VZtI08Vp3sq/rLGgCnq7+XQnK0mG/O6YOXKr+QMx9fOj1YC/g==
X-Google-Smtp-Source: AGHT+IH8cSac3dGhbsbyvNR59sGWP45jCIIRoKUxzNlqleakm5YV+Y0SAC/bQhwKVy53663DAlPTTg==
X-Received: by 2002:a17:907:9449:b0:a99:f92a:7a66 with SMTP id a640c23a62f3a-a9de5d783e5mr641603966b.30.1730087402156;
        Sun, 27 Oct 2024 20:50:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:78b:e59b:2b0:d2e9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f5932fsm334599366b.168.2024.10.27.20.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:50:01 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: [PATCH v6 00/11] kbuild, kconfig: Add support for conflict resolution
Date: Mon, 28 Oct 2024 04:49:38 +0100
Message-Id: <20241028034949.95322-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Configuring a kernel requires a forward enabling approach where one enables
each option one needs at a time. If one enables an option that selects
other options, these options are no longer de-selectable by design.
Likewise, if one has enabled an option which creates a conflict with a
secondary option one wishes to enable, one cannot easily enable that
secondary option, unless one is willing to spend time analyzing the
dependencies that led to this conflict. Sometimes, these conflicts are not
easy to understand [0,1].

This patch series (for linux-next) provides support to enable users to
express their desired target configuration and display possible resolutions
to their conflicts. This support is provided within xconfig.

Conflict resolution is provided by translating kconfig's configuration
option tree to a propositional formula, and then allowing our resolution
algorithm, which uses a SAT solver (picosat, implemented in C) calculate
the possible fixes for an expressed target kernel configuration.

New UI extensions are made to xconfig with panes and buttons to allow users
to express new desired target options, calculate fixes, and apply any of
found solutions.

We created a separate test infrastructure that we used to validate the
correctness of the suggestions made. It shows that our resolution algorithm
resolves around 95% of the conflicts. We plan to incorporate this with a
later patch series.

We envision that our translation of the kconfig option tree into a
propositional formula could potentially also later be repurposed to address
other problems. An example is checking the consistency between the use of
ifdefs and logic expressed in kconfig files. We suspect that this could,
for example, help avoid invalid kconfig configurations and help with ifdef
maintenance.

You can see a YouTube video demonstrating this work [2]. This effort is
part of the kernelnewbies Kconfig-SAT project [3], the approach and effort
is also explained in detail in our paper [4]. The results from the
evaluation have significantly improved since then: Around 80 % of the
conflicts could be resolved, and 99.9 % of the generated fixes resolved the
conflict. It is also our attempt at contributing back to the kernel
community, whose configurator researchers studied a lot.

Patches applicable to next-20241025.

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

Changelog v6:
* remove script for manually installing PicoSAT
* adapt documentation and help text in the GUI accordingly
* convert Qt signal/slot connects to new style

Changelog v5:
* use lists from scripts/include/list.h
* use PicoSAT as a dynamically loaded library
* Fix GUI bug that made the displayed tables editable
* Allow cycling through the desired values of a symbol in the conflict view
  in the GUI by clicking on the cell
* Fix usage of "NO" instead of "N" etc. in some places in the GUI
* Improve function naming
* Add documentation
* Simlify xcalloc to xmalloc in some places
* Fix allocation bug in fexpr_add_to_satmap() and init_data()
* Remove functions pexpr_eliminate_dups() and print_expr()

Ole Schuerks (11):
  kconfig: Add PicoSAT interface
  kbuild: Add list_size, list_at_index, list_for_each_from
  kconfig: Add definitions
  kconfig: Add files for building constraints
  kconfig: Add files for handling expressions
  kconfig: Add files for RangeFix
  kconfig: Add files with utility functions
  kconfig: Add tools
  kconfig: Add xconfig-modifications
  kconfig: Add loader.gif
  kconfig: Add documentation for the conflict resolver

 Documentation/kbuild/kconfig.rst    |   56 +
 scripts/include/list.h              |   49 +
 scripts/kconfig/.gitignore          |    1 +
 scripts/kconfig/Makefile            |   11 +-
 scripts/kconfig/cf_constraints.c    | 1779 ++++++++++++++++++++++++
 scripts/kconfig/cf_constraints.h    |   24 +
 scripts/kconfig/cf_defs.h           |  391 ++++++
 scripts/kconfig/cf_expr.c           | 2003 +++++++++++++++++++++++++++
 scripts/kconfig/cf_expr.h           |  181 +++
 scripts/kconfig/cf_rangefix.c       | 1136 +++++++++++++++
 scripts/kconfig/cf_rangefix.h       |   21 +
 scripts/kconfig/cf_utils.c          |  980 +++++++++++++
 scripts/kconfig/cf_utils.h          |  112 ++
 scripts/kconfig/cfoutconfig.c       |  149 ++
 scripts/kconfig/configfix.c         |  351 +++++
 scripts/kconfig/configfix.h         |   31 +
 scripts/kconfig/expr.h              |   17 +
 scripts/kconfig/loader.gif          |  Bin 0 -> 4177 bytes
 scripts/kconfig/picosat_functions.c |   74 +
 scripts/kconfig/picosat_functions.h |   35 +
 scripts/kconfig/qconf.cc            |  676 ++++++++-
 scripts/kconfig/qconf.h             |  111 ++
 22 files changed, 8184 insertions(+), 4 deletions(-)
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
 create mode 100644 scripts/kconfig/picosat_functions.c
 create mode 100644 scripts/kconfig/picosat_functions.h

-- 
2.39.5


