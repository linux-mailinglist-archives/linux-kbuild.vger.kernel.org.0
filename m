Return-Path: <linux-kbuild+bounces-3641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9EE97D30E
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 10:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EAE7283229
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 08:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AD17DA6E;
	Fri, 20 Sep 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZZ084ew"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2143A22EEF;
	Fri, 20 Sep 2024 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822605; cv=none; b=NmG6lm5Tm2ybdxYBfOPbttOAjNWS8q5SrV8GEIH2Ua8ZsEO78FBq1eEiEqqck01iVEF8UMca/3BUPnk5p4sMJRbT5vXfKwEh/Ufmm1BonV0HX1hv0AMyUf3NeIwsQzEai+gNByjkfHSom4yKMJkOFT6gIItUDEaPIVWgXOyDLCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822605; c=relaxed/simple;
	bh=/aNzG0VvDQiJBoENuzXT9mrjGoM/WraE9mg2UaXs5lA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GPuf/3JmlMm3virae3fgLW3AdtM5kbA6qBkd/rTitMcmhO/QivqaqHa2wyAKwuhAul4B8qKF58jnkCh/1oYfBbwRHmjPAG/PVM340XX/yLgXUpMccoSff/h/xs4wD03OIDKf3nksilpPgUezAd76r04Wk0wsoOh4ku52SvvD+9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZZ084ew; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a83562f9be9so200862466b.0;
        Fri, 20 Sep 2024 01:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726822600; x=1727427400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRaxuEQlfKW2g/XHgBJt6Xs+eFFiMWGCan6Za5aU4eI=;
        b=NZZ084ewfwnyAB2Qr9/OLPhEUDuFKILbsUHliyHwf1WCoi8CTcVHcIVSHHFowLFDWY
         3emnr8xr2BbUX2lI+l9Pdf4zOpWEQO5niuXF4FwGRzwu7vhE6bTiGGbtjJXf6r/Ziqjb
         bpSpuva2haD/RQBPxdlpt8ZvcBtuGOjhRtIhQq/Nm/Kfo3uYSFkSG5fwt3euRyaqODc8
         tNGa7dU1CdU58BzPqE15yH60CG4ujyRSd4dHMXdLfG5gyhZu8RzNN5lGTglsBALus2Vd
         952Dm1fQSsNz/vh8A6crRVw6n2+nLuM9h6I34OSsSNZDSnjtEo4MurDBRpE+AKc7D6+F
         JYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726822600; x=1727427400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRaxuEQlfKW2g/XHgBJt6Xs+eFFiMWGCan6Za5aU4eI=;
        b=JJhwerSu2dUeu/FiN0NkyGMCWAy/Jby98yIsYbG1oJWGlK8CpakJ9gFN7bJjBkTR/V
         sfVJSN7pHVO5oHLzRXIcOXVigMWIYtm0msHpTpy/025luinjH+NnUlHHZzYfnnRonhK+
         /33CdhoPEs33IUZHSomFDApPxRvkff2XbJar5wDxPBfKLUS8JPXr0aIn1O72Fee9VBo6
         jrGVDNPd47Wv6DKy/7QYIer6x309Ski7ELcanzf97zUASjzmo41C2um72nIrWQAyg29J
         AHnrBoG+5IV/AA+XVUX97YiocceunHnAhY8q3ExQxSY5LcThOV00ZCV7ka8dTaki37UO
         z29A==
X-Forwarded-Encrypted: i=1; AJvYcCUjmN4xt+xKIJZl4qMUqdnA8vUr7den7Jjz2pPhXiCdMOFSeVlrnRIFIlZq9QHQhMOcdEZws2i+loddNH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOvJSDbL/Sc+AhHESvOinyQg2IaRWOMc49u6wrLQWjtdota2z
	RtM+MWT54B/UV/u0jvnPqhlTk3DFuqUsMKg7LuHk1c+nYOOyUFtAaqkTWA==
X-Google-Smtp-Source: AGHT+IGyNG9aT1ZJpCKkfu8YApBJQZiv5Pwkbbn+pOreJas768yk8cg0P+fItatkHUOlmi5MRsVXBw==
X-Received: by 2002:a17:907:3f9f:b0:a86:a41c:29e with SMTP id a640c23a62f3a-a90d4fc84dcmr171406166b.2.1726822599852;
        Fri, 20 Sep 2024 01:56:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:422c:48db:9094:2fa9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109637esm817861866b.40.2024.09.20.01.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:56:39 -0700 (PDT)
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
Subject: [PATCH v5 00/11] kbuild, kconfig: Add support for conflict resolution
Date: Fri, 20 Sep 2024 10:56:17 +0200
Message-Id: <20240920085628.51863-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
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

Patches applicable to next-20240917.

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
  kbuild: Add list_is_{first,last}, list_size, list_at_index,
    list_for_each_from
  kconfig: Add definitions
  kconfig: Add files for building constraints
  kconfig: Add files for handling expressions
  kconfig: Add files for RangeFix
  kconfig: Add files with utility functions
  kconfig: Add tools
  kconfig: Add xconfig-modifications
  kconfig: Add loader.gif
  kconfig: Add documentation for the conflict resolver

 Documentation/kbuild/kconfig.rst    |   53 +
 scripts/include/list.h              |   71 +
 scripts/kconfig/.gitignore          |    1 +
 scripts/kconfig/Makefile            |   11 +-
 scripts/kconfig/cf_constraints.c    | 1789 ++++++++++++++++++++++++
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
 scripts/kconfig/install-picosat.sh  |   29 +
 scripts/kconfig/loader.gif          |  Bin 0 -> 4177 bytes
 scripts/kconfig/picosat_functions.c |   74 +
 scripts/kconfig/picosat_functions.h |   35 +
 scripts/kconfig/qconf.cc            |  623 ++++++++-
 scripts/kconfig/qconf.h             |  111 ++
 23 files changed, 8189 insertions(+), 4 deletions(-)
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
 create mode 100755 scripts/kconfig/install-picosat.sh
 create mode 100644 scripts/kconfig/loader.gif
 create mode 100644 scripts/kconfig/picosat_functions.c
 create mode 100644 scripts/kconfig/picosat_functions.h

-- 
2.39.2


