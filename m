Return-Path: <linux-kbuild+bounces-12743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CtZHEH42GmGkQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12743-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 15:16:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0777F3D8098
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 15:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EA6A302FEB6
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 13:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766D4397E6D;
	Fri, 10 Apr 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SOssgENC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F929AB02
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775826844; cv=none; b=ImbwGCs+Eatl+ZFmmzNEz/lSelmvX4xos4X0sa1cKn5Xk0qgmIBJxll+pZKZJ9dDhiNyYd0xdYkDCaVykMQPTNz0cKMlCoDYYp2Igg5/l5rLvaqUP/e4KOi06EJ8ZFETifBDL57dRFGxNTqSXguaDF94qrMU9qd485PKdTe+pTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775826844; c=relaxed/simple;
	bh=976uIWqM+FAARkVCOlYC9MMYiaR61LoNWXMDyjXKX0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CC3w+8wFGYQhghIT930qbptisB8zsJEbji9J01N7/i0cK163G9Clmo03XTaR/eXCihDO8L4bi/mR2Q3M2ivUiUEUURS/ja9CdAhSaqpbFmwZg0yFFnCXFEzVkfMrs+BHHwsEsz2P39nqC3EVnqHTpkDBv4oxhoBWuEX47U+9vgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SOssgENC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so1218977f8f.2
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Apr 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775826840; x=1776431640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cj9MH/EknDN0OlocU9ytBdhpwEb+nE5xbjRi72XOo6g=;
        b=SOssgENCYtFE8mMVtaMPc4Eoanim850Xwgv5AIOXTwp8WqM+VRz/jO9HfLl3Zpo62r
         keKflhQXPsZFzzpxLmfd/0lQok7w8NW96ijMqf3HNKlXKxjv2LDkbEh3F5Jmb3kxTbfC
         6wHGd/VZqMs1325dwNf8x0z4PXwL9Qre8fDXPHNye5r7Vd1t40lgy3xbhUh6ei0SVKZ4
         l1ajlWnjdjIP+YRAOwI5SKUkJBxGjNnCaht2VjryD4yaBkoF4ZwuHMLlEvWPBKJskfTI
         2538yxL1Oi+CNNXWjXNmPW+ozXC6LuZRpJy7ldrWcvGskS5pubm2t5yc8/dMKn+Zrc3x
         Tcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826840; x=1776431640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cj9MH/EknDN0OlocU9ytBdhpwEb+nE5xbjRi72XOo6g=;
        b=Lvt4G7NgaE1ifcN8e3yGBrwlMKJxAFYI8tPvcjXObdEX3ZYgGrjJLnsyc5HNFvYLoQ
         cx0JYkyKITTOuDq562hRMG//SMzs0yZEmL1C0L/mBvSwAQpjTscuOif3WKSc24JJLc7b
         lmxRSsI9K+ha1raXlzIFOf59n5DzMm7Ik6ub8j0dfMyg69LrAsQE7CcKXT3LwAWk+WYy
         otrjXlM4ut1ZBvIAZVj3YbHDdixARnZxzWWEwluDpOnUeDTeQtYJ6lGwTpddie1LU1L4
         A5e8wsK0mi+uhw+Uo5bJObf3ElZ2oUCNM86PMqsepU6m8wtVRw09TS1W0q3xHFLNwH1M
         slyw==
X-Forwarded-Encrypted: i=1; AJvYcCW6eZv7MCTcbOcFkaEXklEHq/FMNCuZdl6n+ghoA4stf5Lqnld4v4UPHEE9PTZTaMLxa/F5Rp/ZnoOpkdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxYFQ2VukDj+RL79P6logGpi35Kc7T+cfe6C4H5z9fc0XiUM7
	myDwpmOShAABzQ+T09iCudYBOqpYSUK7b00lEhl1jxYqIBSmrvrmhm0A286Qkr+KmaE=
X-Gm-Gg: AeBDietBFNDD4cbaNYBibDmuUO+3CW95NMBMjcrl+h5t2Hv2xH2hz1RKjrZaJAxHv7c
	RUxT02W1AJWSRCvjatKkJO5Ew+5ZMu6ceBRqbeXDKPeT9BAVJEclZkbWItglWoo4KIraV3KrM3l
	CsDMtZl8Kbq4puSWeLrG02+H+7nVUguSCEovl8ETSckT1oaxbJY7qkGmki1yXQQcvkyII9pHPkN
	0bWs9TFgIWp3Pve9LpcypeD1WgxvTSNcu2lIn3JPCC4OHspDWQchJa5zyGmiCAlhTZpmVdz5B4Z
	j5eeVmUjXs7zTUEhfGhT95vJEeSDQzJdlvzohho0ki4OP2Dv7lYM4YscBSJGYqHJH/nu6z1yBCX
	SDKpwUfDtEMMG8YCh4AC6HNHjKj0QGTlhkQQL9BjQK18DAwyGq0xSHdXXhfDzo8UvMKYTvXIqNl
	TToGxlm7aZ7XFgoT3G9JTrrw1WY/npnSJ6YqbdLTt9iq2vrWRNryo=
X-Received: by 2002:a05:6000:200f:b0:43b:8806:be32 with SMTP id ffacd0b85a97d-43d642552f3mr5071820f8f.7.1775826840140;
        Fri, 10 Apr 2026 06:14:00 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de3499sm6993731f8f.1.2026.04.10.06.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:13:59 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH] kbuild/btf: Remove broken module relinking exclusion
Date: Fri, 10 Apr 2026 15:13:29 +0200
Message-ID: <20260410131343.2519532-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,kernel.org,fomichev.me,google.com,atomlin.com,vger.kernel.org,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12743-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0777F3D8098
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enabled
and pahole supports it") in 2020 introduced CONFIG_DEBUG_INFO_BTF_MODULES
to enable generation of split BTF for kernel modules. This change required
the %.ko Makefile rule to additionally depend on vmlinux, which is used as
a base for deduplication. The regular ld_ko_o command executed by the rule
was then modified to be skipped if only vmlinux changes. This was done by
introducing a new if_changed_except command and updating the original call
to '+$(call if_changed_except,ld_ko_o,vmlinux)'.

Later, commit 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some
in-kernel build artifacts") in 2024 updated the rule's reference to vmlinux
from 'vmlinux' to '$(objtree)/vmlinux'. This accidentally broke the
previous logic to skip relinking modules if only vmlinux changes. The issue
is that '$(objtree)' is typically '.' and GNU Make normalizes the resulting
prerequisite './vmlinux' to just 'vmlinux', while the exclusion logic
retains the raw './vmlinux'. As a result, if_changed_except doesn't
correctly filter out vmlinux. Consequently, with
CONFIG_DEBUG_INFO_BTF_MODULES=y, modules are relinked even if only vmlinux
changes.

It is possible to fix this Makefile issue. However, having the %.ko rule
update the resulting file in place without starting from the original
inputs is rather fragile. The logic is harder to debug if something breaks
during a subsequent .ko update because the old input is lost due to the
overwrite. Additionally, it requires that the BTF processing is idempotent.
For example, sorting id+flags BTF_SET8 pairs in .BTF_ids by resolve_btfids
currently doesn't have this property.

One option is to split the %.ko target into two rules: the first for
partial linking and the second one for generating the BTF data. However,
this approach runs into an issue with requiring additional intermediate
files, which increases the size of the build directory. On my system, when
using a large distribution config with ~5500 modules, the size of the build
directory with debuginfo enabled is already ~25 GB, with .ko files
occupying ~8 GB. Duplicating these .ko files doesn't seem practical.

Measuring the speed of the %.ko processing shows that the link step is
actually relatively fast. It takes about 20% of the overall rule time,
while the BTF processing accounts for 80%. Moreover, skipping the link part
becomes relevant only during local development. In such cases, developers
typically use configs that enable a limited number of modules, so having
the %.ko rule slightly slower doesn't significantly impact the total
rebuild time. This is supported by the fact that no one has complained
about this optimization being broken for the past two years.

Therefore, remove the logic that prevents module relinking when only
vmlinux changes and simplify Makefile.modfinal.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
My previous attempt to fix this logic can be found at
https://lore.kernel.org/linux-modules/20260402141911.1577711-1-petr.pavlu@suse.com/
---
 scripts/Makefile.modfinal | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index adcbcde16a07..01a37ec872b9 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -46,17 +46,9 @@ quiet_cmd_btf_ko = BTF [M] $@
 		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
 	fi;
 
-# Same as newer-prereqs, but allows to exclude specified extra dependencies
-newer_prereqs_except = $(filter-out $(PHONY) $(1),$?)
-
-# Same as if_changed, but allows to exclude specified extra dependencies
-if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
-	$(cmd);                                                              \
-	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
-
 # Re-generate module BTFs if either module's .ko or vmlinux changed
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
-	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
+	+$(call if_changed,ld_ko_o)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif

base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
-- 
2.53.0


