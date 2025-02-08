Return-Path: <linux-kbuild+bounces-5676-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01640A2D763
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 17:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A34443A7C6C
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2025 16:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAAF1F3B82;
	Sat,  8 Feb 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O57FfRog"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C8B1F3B80;
	Sat,  8 Feb 2025 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032838; cv=none; b=hksQo4EHvZGSG70OExPVc7qmQ3JKhZjOvXVmvu3Rq4L8lNcC0xHasS1KdMQY2xi0nzHeaMaOqXh5vxoGc258uiYNNJRaMq3UZS88NZDwP3HiPj1AYYNIdL2RzpmJHnSb9IZ72rFE+/D+mknXmZMUhXTAfT0yZO3xtDNoiPLp0+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032838; c=relaxed/simple;
	bh=gwyxQppTZ6ZO4D9idadBtie7X44uxwY+JpRpSHRkf2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SZ34vQeGOolXdRvxiIo8stQ+LYbi97j/bMCFp7AvGYbVY2RjnLINSt1WCHPC5GOrQaEw94NcZlUpzHoel4ac0RPNut3cPI15aWT7/9P93FvqsUaBE2eLjyK3DvLAsWGvWEdLxhXAp1GKjUq6iemhZIS6pYewXfyYDAdqdSzBkqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O57FfRog; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7a6758b7fso77067666b.3;
        Sat, 08 Feb 2025 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739032833; x=1739637633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mc24O4UZ8Z0GQn+gkUkIxjuAxjUc2vNJ/QfOa/Tzl38=;
        b=O57FfRogVx/gOmYaP+8kdpv33+Y3AziGljSs+laOrZgSX2EKATzaSLh7GeFJBTwj6k
         QeNIeo9jEif8IIlRK0F+E8fnBGx++fqmiLJsmJ9mT0NgYO5hQierp+jAJaTSKaohdHak
         nzW6m1AO47G59ZcLBQJ1H+sc2zehDONYw8bSn03zES9vNcerf4wVIYZNvwCdBS3Ju/EQ
         vC3XwQCZ+Ur3yI0GkA5DzwF3EYbzfhVYykXw6N+evGqxK2QXwqR0tWPPd+xGRk5mohu+
         lOwic+gOUhc4YaI2RRDaUY+rISRyVUyRO6A1O17R4mH2fKjYE0G/M8Y21ldBPX3w5hY3
         Q5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032833; x=1739637633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mc24O4UZ8Z0GQn+gkUkIxjuAxjUc2vNJ/QfOa/Tzl38=;
        b=MEv3uFrsl9+oIRiHpT+8u5Xfw1SI3zr1jd7PKc2VdIBj2XZq4ZnsqFhhscDUhrDaa8
         Z45ZUHkQeOYiUTix8gmRT6yB3aD/TVZF38toNKeqKXswAk+d7/jwQ4IXfDN6vYOnQ8L0
         t23Jh2r4uN2ZpTN89h93LrUAXEsjwORVsIBtu4i3l1BhjZ0evT6ebJf96+eaRG9nFB+h
         jzG2O8zbWsIjzW6ncTmP26sfhU/p7PcnZDSSlQOeRpvOGfXbKKvRN/YB5vhdFyXD3YRF
         kpoyLzn8+ZAU3QkYcS73onFUN8W1tRuomnxVGZ8E+dyl4QKJbiOWqdU0BnEg3hP2PIoK
         q7uA==
X-Forwarded-Encrypted: i=1; AJvYcCUBLrO+Z8LiQcxObDfrEwtG0SjsOJDlXbGviiCNQu8p4xiXW7TlAuQ04opiQE8WFKlxJM7Viw/NAaliT/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpLJCnP0CqpU0Q8N4QvdS8+L4qrK+lejPGd+nc0Bzq4VxpZaA
	RnLtGqstQTQhGQp/TV01MoICgUaZ2LKSVBAdyfysxBJ3loitws+PuZHleg==
X-Gm-Gg: ASbGnctYM+41DWcVxjJJFqS4ARR38B9gKzWhfBTd0L7s3ta9TmdtO7af4mRVBtl6Tq7
	mnmSMBzM4LAVl8Bat8cns8rWAUP1UaenlE6Zgp93qDo9LL0/ji/efcNv2im3ckVqY+mMfB/jaD0
	HpROoDSPnnq6/KVs7xMEJcE+0fPmVMovw6MxeiFzXJ7+DMuT3z+sTAxEUKLyBftuVMCUK8jhcS3
	2+yO8AhJATGlcwKv0yvmc3YstdY4oC5iCYnz1b8oWM1SFqp1/8egyv+aEHqbjgqvbQUbgy8ERpf
	4dC4zXJ45LIjy88v9IM1SDx27wr93g==
X-Google-Smtp-Source: AGHT+IGr1CEMd8y2rK5O4w/0JUHq1rECwILhXc1fY+5ny/S9MkWPRI02UomwiBcpHf30qe9HS6YfHg==
X-Received: by 2002:a17:907:7d91:b0:ab6:cf9c:584a with SMTP id a640c23a62f3a-ab789b6e385mr836846166b.15.1739032832455;
        Sat, 08 Feb 2025 08:40:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:908:e842:bf20:e115:64e7:5d6:176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773337f3dsm501539166b.139.2025.02.08.08.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:40:32 -0800 (PST)
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
Subject: [PATCH v7 00/11] kconfig: Add support for conflict resolution
Date: Sat,  8 Feb 2025 17:39:48 +0100
Message-Id: <20250208163959.3973163-1-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series (for next-20250207) provides support to enable users
to express their desired target configuration and display possible
resolutions to their conflicts. This support is provided within xconfig.

Conflict resolution is provided by translating kconfig's configuration
option tree to a propositional formula and allowing our resolution
algorithm and PicoSAT to calculate the possible fixes for an expressed
target kernel configuration. PicoSAT is the smallest and most robust C SAT
solver we could find which is also GPL compatible. PicoSAT is used as a
dynamically loaded library. For Debian and Fedora, the apt and dnf packages
named "picosat" provide the library. For other distros, we provide
instructions on how PicoSAT needs to be compiled from the sources in the
documentation.

New UI extensions are made to xconfig with panes and buttons to allow users
to express new desired target options, calculate fixes, and apply any of
found solutions.

You can see a YouTube video demonstrating this work [2]. This effort is
part of the kernelnewbies Kconfig-SAT project [3], the approach and effort
is also explained in detail in our paper [4]. The results from the
evaluation have significantly improved since then: Around 80 % of the
conflicts could be resolved, and 99.9 % of the generated fixes resolved the
conflict. It is also our attempt at contributing back to the kernel
community, whose configurator researchers studied a lot.

Patches applicable to next-20250207.

[0] https://gsd.uwaterloo.ca/sites/default/files/vamos12-survey.pdf
[1] https://www.linux-magazine.com/Issues/2021/244/Kconfig-Deep-Dive
[2] https://www.youtube.com/watch?v=vn2JgK_PTbc
[3] https://kernelnewbies.org/KernelProjects/kconfig-sat
[4] http://www.cse.chalmers.se/~bergert/paper/2021-icseseip-configfix.pdf

Thanks from the team! (and thanks to Luis Chamberlain for guiding us here)

Changelog v7:
* improve error handling when loading picosat symbols with dlsym(): use
  dlerror() instead of checking for NULL
* move list_at_index from scripts/include/list.h to
  scripts/kconfig/cf_utils.h
* change interface of list_for_each_entry_from and rename list_size to
  list_count_nodes to more closely match scripts/include/list.h
* change misleading name "rangefix" of fix generation algorithm to
  "fixgen"

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
  kconfig: Add definitions
  kbuild: Add list_count_nodes and list_for_each_entry_from
  kconfig: Add files for building constraints
  kconfig: Add files for handling expressions
  kconfig: Add files for fix generation
  kconfig: Add files with utility functions
  kconfig: Add tools
  kconfig: Add xconfig-modifications
  kconfig: Add loader.gif
  kconfig: Add documentation for the conflict resolver

 Documentation/kbuild/kconfig.rst    |   56 +
 scripts/include/list.h              |   26 +
 scripts/kconfig/.gitignore          |    1 +
 scripts/kconfig/Makefile            |   11 +-
 scripts/kconfig/cf_constraints.c    | 1777 ++++++++++++++++++++++++
 scripts/kconfig/cf_constraints.h    |   24 +
 scripts/kconfig/cf_defs.h           |  391 ++++++
 scripts/kconfig/cf_expr.c           | 2003 +++++++++++++++++++++++++++
 scripts/kconfig/cf_expr.h           |  181 +++
 scripts/kconfig/cf_fixgen.c         | 1136 +++++++++++++++
 scripts/kconfig/cf_fixgen.h         |   21 +
 scripts/kconfig/cf_utils.c          |  980 +++++++++++++
 scripts/kconfig/cf_utils.h          |  136 ++
 scripts/kconfig/cfoutconfig.c       |  149 ++
 scripts/kconfig/configfix.c         |  352 +++++
 scripts/kconfig/configfix.h         |   31 +
 scripts/kconfig/expr.h              |   17 +
 scripts/kconfig/loader.gif          |  Bin 0 -> 4177 bytes
 scripts/kconfig/picosat_functions.c |   79 ++
 scripts/kconfig/picosat_functions.h |   35 +
 scripts/kconfig/qconf.cc            |  676 ++++++++-
 scripts/kconfig/qconf.h             |  111 ++
 22 files changed, 8189 insertions(+), 4 deletions(-)
 create mode 100644 scripts/kconfig/cf_constraints.c
 create mode 100644 scripts/kconfig/cf_constraints.h
 create mode 100644 scripts/kconfig/cf_defs.h
 create mode 100644 scripts/kconfig/cf_expr.c
 create mode 100644 scripts/kconfig/cf_expr.h
 create mode 100644 scripts/kconfig/cf_fixgen.c
 create mode 100644 scripts/kconfig/cf_fixgen.h
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


