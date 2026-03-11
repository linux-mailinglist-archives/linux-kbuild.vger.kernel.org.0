Return-Path: <linux-kbuild+bounces-11814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BRmJRXdsGn7nwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11814-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 04:10:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618D25B4B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 04:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABD69304F0B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 03:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498CB1D5CD1;
	Wed, 11 Mar 2026 03:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqwin20d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4EC5733E
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 03:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198107; cv=pass; b=mmCxqYPAAf0ZoVDWShh6qTPePYNQciIX1gSgQ4uIGmEBBI91UyYbRSj820Ckwy8ky4ldJvctl9nw3P1MUZ7cp14cyDYGzWSnkQnfeFw7Twj0lYRuYxG2EiwC+bSSwzinn82+T9QPKsppEJcUmdbnypXip3tUAEGuNFrKRPoKCMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198107; c=relaxed/simple;
	bh=USuETOR02EbnP9jNk2rssD+vogCYatSUJBzHNjqx5UA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nv6X4/I1I+fyCyZizYv5/8eI2ihkT35JmSAm7Gs/cRZmFs4kBO3UXwPfn3c+REMBNkGj80t65WjTrMA2/Y1N+qmoEozcP7yN9SY7/+ewfKCgg7vZdAQW/MHNkGxfBrYJiI6oOZ1Kq3QzBPmAXMeQ7K43dq4dJO7+zMQuX2IAevc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqwin20d; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d744d9acbeso1148805a34.1
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 20:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773198104; cv=none;
        d=google.com; s=arc-20240605;
        b=YHWev6NdKjrYcw9PH+HcyvYyJ9tIGeXiG1TBCoKZLp7IKdsaiZosuC8Pj21Sg1hxpF
         vKYqNN+0OxKn21GicqeOgAv//YyNaczsv6P3m98UXwYk1wMJuNtrVcFEyvdE3TcjCS29
         qCMe8PtU3qeLPyVoFMyV5c7tQCsdvQTNdKvPENfFASyd7Uk3eY3lehMTYvuEs85Q7OWG
         auNLRBZdVfdY6Q2LZvjNIyqLl0e5mz5zYK9KWU+zb4bQc3MjlpMIbCaFPa0/HVqiDEIp
         6+t8lpArcMbkyiqPo1dq8czONPrurytWXG1esnf6gvTr/UZJQB8BaVX4LQU9dgf2aTPV
         NIDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lwcYZshukT9x5+YvWHrQP2/uutb5FLKAKZH6xp0g/sg=;
        fh=FoRLi6Ju2hxWi9ydYMgWheuheYlYKA7/lTtNmEba4VI=;
        b=U/sm+A0n2YjFAtSjQynTkhXpzbtZXsXktIla5R1WJIwbCH1GG6014h4si87XZu8ken
         rh0g7a24mYJTGS6ShK8jSm/5BEN4GaDirD20Fyp3zrlLM7VKWuXLVlWhlOvzjIC17o08
         eIkCyKFz5rsXu8eUTVUOJCVdsLGZl9lkiMia/IPLPnACBcvqNiwqgGN7dhLJHL+DLcj8
         xc+GplGqcndGZjRsyf3aADClDZKYAuTqCmdh6ko8wo22e9r2UopgIgv/Xz8MJC/unRsd
         vld8IKb8Q6Voli1CU5CSqFQPNao5Zf3V0dvAMpzXgP83tmyoYakUwYhru2YStwHMuWGY
         ZUtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773198104; x=1773802904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwcYZshukT9x5+YvWHrQP2/uutb5FLKAKZH6xp0g/sg=;
        b=dqwin20dTmizWOEPNxa6+ctOlUBTRtNXbK4U0sGDGJFbFiBM2rAT9NdyWfWaFSHjWI
         7n3a+vKq62BuA/dMIiYFcsWLCtwcNsArGv5cFNkaO2z25V7NcCFHGXsrRxvG9ApQIT1q
         5ohoKGtNLIZHsrJM7VMIwLJbF3ZS4aWM8v/1dxOhPoSoIBPBaQiWq1moZ0zQjGCosJrn
         yNiY8hiuP3GO03TUHmgiAjm5ABdst2BCsvP5IG20xHgkO9f1fJPO+d/gHK85kAyY7Qsd
         a3ov4TU0Xd9D1zS2hzPBo0fSxwkiuoy5Vz3iB0hFmIO86Lekt5DcwHZ/U/xMv1s9HSqk
         rLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198104; x=1773802904;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwcYZshukT9x5+YvWHrQP2/uutb5FLKAKZH6xp0g/sg=;
        b=QjmHAnQYoeisGo6f0QKKOGVPPP5PwtQgpRk61iTx4mX/RtbkXE/FGUz/6YEXpYIDXw
         vunJE9cVK4mYU8qdF0x2a97TugOW8Ad2FLwTEiSXATdm0WnL2hKg7n1cxN+oY2gFpXu8
         0YBHAyZDaLKdUZC22uZng0eMiQiFF8M41SiLQR1wlcImwpWgKLKZk5dxfZuTY1KKF4So
         uVBZfo8W4V74A48Vji5yD1ygA0fy1OYJ6Pv4uPDFpuQVE4y7O6dwWCy5ggUOYkLYuIlp
         Fbxr6Vn01B+EbGX9IdESgGU5DF26n8TFXZZjPtRQgEP6sg7cLb2z1bEi1KCG2KJaOElU
         k9bw==
X-Forwarded-Encrypted: i=1; AJvYcCV6gOb0yPjXHV48wpVCbNZilVCi276V2ECmyJ1oDH5zT6JNjS0GCneCTctMeq0zewYgDrBr+9LfiV0Mkxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZq10VYB6IgRdSqS1H2zutpA278Nn2FsYMmEqLQPxpakmP+EAB
	uMS2K7a8gsk3RrC+zPVSFh2LFkIobSsdRbj+0b2z7bNS0P5P+27yyIAjaJm1KJ8gGgiOeZy62bC
	yvppgEyF49ZQjnyIyWaIQkL9oMad7b50=
X-Gm-Gg: ATEYQzyKJcfET9v3pet3f3hlvPljgqCN8rwrkZ/antCpKB1LSwktA76eqcvsFfJkHBR
	LKEmZV9yNfSawql3ZCzJqn3oWuWQLGNSjYS79+XQjPmMxS4d1DMN3TPxgnqPDZmOkWvmoUkgzYu
	oiCVY3lAZcjR8ZXMnuaDEjzXqwqqrL6SuZyfM0lv9GCmVTxUtRssbACZLeS4gKi3XLczuEPH2EU
	t6I2uwpCHn1XYzJBpkFy4fsW0Gop7jml3P2HziyGbRpJ+t/VGsEYvJlMXpx9ezJJl4a8EW1Y5mB
	UkVyP5s=
X-Received: by 2002:a05:6830:81c7:b0:7d7:51a4:d071 with SMTP id
 46e09a7af769-7d76a741d8dmr792249a34.15.1773198103815; Tue, 10 Mar 2026
 20:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Oli <oochiolio@gmail.com>
Date: Tue, 10 Mar 2026 22:01:41 -0500
X-Gm-Features: AaiRm50y1v-api-VJGGCuow_byrgIvm0KBWdyp52p0mvuaQCzwMEaVOX9UDzfF0
Message-ID: <CAOW84UxjnSDKSjsaaS9=DBquCk3SDfb74=OmkHTLUyq5qriYsA@mail.gmail.com>
Subject: [PATCH] Remove unused headers in x86/tools, scripts, pps, input
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Rodolfo Giometti <giometti@enneenne.com>, Henrik Rydberg <rydberg@bitmath.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-input@vger.kernel.org, x86@kernel.org
Content-Type: multipart/mixed; boundary="000000000000183e26064cb6dbe3"
X-Rspamd-Queue-Id: 1618D25B4B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.44 / 15.00];
	MIME_DOUBLE_BAD_EXTENSION(10.10)[.com.patch];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11814-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:-,4:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oochiolio@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[efficios.com,kernel.org,enneenne.com,bitmath.org,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: add header
X-Spam: Yes

--000000000000183e26064cb6dbe3
Content-Type: multipart/alternative; boundary="000000000000183e26064cb6dbe1"

--000000000000183e26064cb6dbe1
Content-Type: text/plain; charset="UTF-8"

From c78a0572f5ec2b927f9b723af687e6ef913561a4 Mon Sep 17 00:00:00 2001
From: Eddie Hudgins <Oochiolio@gmail.com>
Date: Tue, 10 Mar 2026 21:53:07 -0500
Subject: [PATCH] Signed-off-by: Eddie Hudgins <Oochiolio@gmail.com>
 arch/x86/tools: Removed headers in relocs_32.c scripts/basic: Removed
headers
 in fixdep.c drivers/pps: Removed headers in pps.c drivers/input: Removed
 headers in input-mt.c

These changes compile for x86, x86_64, and powerpc (Those were the only
ones fairly tested) under defconfig. This aims to clean up code and
simplify the files for developers. This will also contribute to start of
decluttering the environment.
---
 arch/x86/tools/relocs_32.c | 1 -
 drivers/input/input-mt.c   | 1 -
 drivers/pps/pps.c          | 3 ---
 scripts/basic/fixdep.c     | 1 -
 4 files changed, 6 deletions(-)

diff --git a/arch/x86/tools/relocs_32.c b/arch/x86/tools/relocs_32.c
index 9442ff78be83..9e4668e74993 100644
--- a/arch/x86/tools/relocs_32.c
+++ b/arch/x86/tools/relocs_32.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "relocs.h"
-
 #define ELF_BITS 32

 #define ELF_MACHINE            EM_386
diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index c06e98fbd77c..b553b7f2313a 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -7,7 +7,6 @@

 #include <linux/input/mt.h>
 #include <linux/export.h>
-#include <linux/slab.h>
 #include "input-core-private.h"

 #define TRKID_SGN      ((TRKID_MAX + 1) >> 1)
diff --git a/drivers/pps/pps.c b/drivers/pps/pps.c
index c6b8b6478276..a9a8802c2399 100644
--- a/drivers/pps/pps.c
+++ b/drivers/pps/pps.c
@@ -7,14 +7,11 @@

 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

-#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
-#include <linux/sched.h>
 #include <linux/uaccess.h>
 #include <linux/idr.h>
 #include <linux/mutex.h>
-#include <linux/cdev.h>
 #include <linux/poll.h>
 #include <linux/pps_kernel.h>
 #include <linux/slab.h>
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index cdd5da7e009b..feb9e7d8984d 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -89,7 +89,6 @@
  *  but I don't think the added complexity is worth it)
  */

-#include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
 #include <fcntl.h>
--
2.43.0

--000000000000183e26064cb6dbe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From c78a0572f5ec2b927f9b723af687e6ef913561a4 Mon Sep 17 0=
0:00:00 2001<br>From: Eddie Hudgins &lt;<a href=3D"mailto:Oochiolio@gmail.c=
om">Oochiolio@gmail.com</a>&gt;<br>Date: Tue, 10 Mar 2026 21:53:07 -0500<br=
>Subject: [PATCH] Signed-off-by: Eddie Hudgins &lt;<a href=3D"mailto:Oochio=
lio@gmail.com">Oochiolio@gmail.com</a>&gt;<br>=C2=A0arch/x86/tools: Removed=
 headers in relocs_32.c scripts/basic: Removed headers<br>=C2=A0in fixdep.c=
 drivers/pps: Removed headers in pps.c drivers/input: Removed<br>=C2=A0head=
ers in input-mt.c<br><br>These changes compile for x86, x86_64, and powerpc=
 (Those were the only ones fairly tested) under defconfig. This aims to cle=
an up code and simplify the files for developers. This will also contribute=
 to start of decluttering the environment.<br>---<br>=C2=A0arch/x86/tools/r=
elocs_32.c | 1 -<br>=C2=A0drivers/input/input-mt.c =C2=A0 | 1 -<br>=C2=A0dr=
ivers/pps/pps.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---<br>=C2=A0scripts/=
basic/fixdep.c =C2=A0 =C2=A0 | 1 -<br>=C2=A04 files changed, 6 deletions(-)=
<br><br>diff --git a/arch/x86/tools/relocs_32.c b/arch/x86/tools/relocs_32.=
c<br>index 9442ff78be83..9e4668e74993 100644<br>--- a/arch/x86/tools/relocs=
_32.c<br>+++ b/arch/x86/tools/relocs_32.c<br>@@ -1,6 +1,5 @@<br>=C2=A0// SP=
DX-License-Identifier: GPL-2.0<br>=C2=A0#include &quot;relocs.h&quot;<br>-<=
br>=C2=A0#define ELF_BITS 32<br><br>=C2=A0#define ELF_MACHINE =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0EM_386<br>diff --git a/drivers/input/input-mt.c=
 b/drivers/input/input-mt.c<br>index c06e98fbd77c..b553b7f2313a 100644<br>-=
-- a/drivers/input/input-mt.c<br>+++ b/drivers/input/input-mt.c<br>@@ -7,7 =
+7,6 @@<br><br>=C2=A0#include &lt;linux/input/mt.h&gt;<br>=C2=A0#include &l=
t;linux/export.h&gt;<br>-#include &lt;linux/slab.h&gt;<br>=C2=A0#include &q=
uot;input-core-private.h&quot;<br><br>=C2=A0#define TRKID_SGN =C2=A0 =C2=A0=
 =C2=A0((TRKID_MAX + 1) &gt;&gt; 1)<br>diff --git a/drivers/pps/pps.c b/dri=
vers/pps/pps.c<br>index c6b8b6478276..a9a8802c2399 100644<br>--- a/drivers/=
pps/pps.c<br>+++ b/drivers/pps/pps.c<br>@@ -7,14 +7,11 @@<br><br>=C2=A0#def=
ine pr_fmt(fmt) KBUILD_MODNAME &quot;: &quot; fmt<br><br>-#include &lt;linu=
x/kernel.h&gt;<br>=C2=A0#include &lt;linux/module.h&gt;<br>=C2=A0#include &=
lt;linux/init.h&gt;<br>-#include &lt;linux/sched.h&gt;<br>=C2=A0#include &l=
t;linux/uaccess.h&gt;<br>=C2=A0#include &lt;linux/idr.h&gt;<br>=C2=A0#inclu=
de &lt;linux/mutex.h&gt;<br>-#include &lt;linux/cdev.h&gt;<br>=C2=A0#includ=
e &lt;linux/poll.h&gt;<br>=C2=A0#include &lt;linux/pps_kernel.h&gt;<br>=C2=
=A0#include &lt;linux/slab.h&gt;<br>diff --git a/scripts/basic/fixdep.c b/s=
cripts/basic/fixdep.c<br>index cdd5da7e009b..feb9e7d8984d 100644<br>--- a/s=
cripts/basic/fixdep.c<br>+++ b/scripts/basic/fixdep.c<br>@@ -89,7 +89,6 @@<=
br>=C2=A0 * =C2=A0but I don&#39;t think the added complexity is worth it)<b=
r>=C2=A0 */<br><br>-#include &lt;sys/types.h&gt;<br>=C2=A0#include &lt;sys/=
stat.h&gt;<br>=C2=A0#include &lt;unistd.h&gt;<br>=C2=A0#include &lt;fcntl.h=
&gt;<br>--<br>2.43.0</div>

--000000000000183e26064cb6dbe1--
--000000000000183e26064cb6dbe3
Content-Type: application/octet-stream; 
	name="0001-Signed-off-by-Eddie-Hudgins-Oochiolio-gmail.com.patch"
Content-Disposition: attachment; 
	filename="0001-Signed-off-by-Eddie-Hudgins-Oochiolio-gmail.com.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mmlgd5rv0>
X-Attachment-Id: f_mmlgd5rv0

RnJvbSBjNzhhMDU3MmY1ZWMyYjkyN2Y5YjcyM2FmNjg3ZTZlZjkxMzU2MWE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFZGRpZSBIdWRnaW5zIDxPb2NoaW9saW9AZ21haWwuY29tPgpE
YXRlOiBUdWUsIDEwIE1hciAyMDI2IDIxOjUzOjA3IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gU2ln
bmVkLW9mZi1ieTogRWRkaWUgSHVkZ2lucyA8T29jaGlvbGlvQGdtYWlsLmNvbT4KIGFyY2gveDg2
L3Rvb2xzOiBSZW1vdmVkIGhlYWRlcnMgaW4gcmVsb2NzXzMyLmMgc2NyaXB0cy9iYXNpYzogUmVt
b3ZlZCBoZWFkZXJzCiBpbiBmaXhkZXAuYyBkcml2ZXJzL3BwczogUmVtb3ZlZCBoZWFkZXJzIGlu
IHBwcy5jIGRyaXZlcnMvaW5wdXQ6IFJlbW92ZWQKIGhlYWRlcnMgaW4gaW5wdXQtbXQuYwoKVGhl
c2UgY2hhbmdlcyBjb21waWxlIGZvciB4ODYsIHg4Nl82NCwgYW5kIHBvd2VycGMgKFRob3NlIHdl
cmUgdGhlIG9ubHkgb25lcyBmYWlybHkgdGVzdGVkKSB1bmRlciBkZWZjb25maWcuIFRoaXMgYWlt
cyB0byBjbGVhbiB1cCBjb2RlIGFuZCBzaW1wbGlmeSB0aGUgZmlsZXMgZm9yIGRldmVsb3BlcnMu
IFRoaXMgd2lsbCBhbHNvIGNvbnRyaWJ1dGUgdG8gc3RhcnQgb2YgZGVjbHV0dGVyaW5nIHRoZSBl
bnZpcm9ubWVudC4KLS0tCiBhcmNoL3g4Ni90b29scy9yZWxvY3NfMzIuYyB8IDEgLQogZHJpdmVy
cy9pbnB1dC9pbnB1dC1tdC5jICAgfCAxIC0KIGRyaXZlcnMvcHBzL3Bwcy5jICAgICAgICAgIHwg
MyAtLS0KIHNjcmlwdHMvYmFzaWMvZml4ZGVwLmMgICAgIHwgMSAtCiA0IGZpbGVzIGNoYW5nZWQs
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvdG9vbHMvcmVsb2NzXzMyLmMg
Yi9hcmNoL3g4Ni90b29scy9yZWxvY3NfMzIuYwppbmRleCA5NDQyZmY3OGJlODMuLjllNDY2OGU3
NDk5MyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvdG9vbHMvcmVsb2NzXzMyLmMKKysrIGIvYXJjaC94
ODYvdG9vbHMvcmVsb2NzXzMyLmMKQEAgLTEsNiArMSw1IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMAogI2luY2x1ZGUgInJlbG9jcy5oIgotCiAjZGVmaW5lIEVMRl9CSVRT
IDMyCiAKICNkZWZpbmUgRUxGX01BQ0hJTkUJCUVNXzM4NgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
bnB1dC9pbnB1dC1tdC5jIGIvZHJpdmVycy9pbnB1dC9pbnB1dC1tdC5jCmluZGV4IGMwNmU5OGZi
ZDc3Yy4uYjU1M2I3ZjIzMTNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lucHV0L2lucHV0LW10LmMK
KysrIGIvZHJpdmVycy9pbnB1dC9pbnB1dC1tdC5jCkBAIC03LDcgKzcsNiBAQAogCiAjaW5jbHVk
ZSA8bGludXgvaW5wdXQvbXQuaD4KICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KLSNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSAiaW5wdXQtY29yZS1wcml2YXRlLmgiCiAKICNkZWZp
bmUgVFJLSURfU0dOCSgoVFJLSURfTUFYICsgMSkgPj4gMSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cHBzL3Bwcy5jIGIvZHJpdmVycy9wcHMvcHBzLmMKaW5kZXggYzZiOGI2NDc4Mjc2Li5hOWE4ODAy
YzIzOTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHBzL3Bwcy5jCisrKyBiL2RyaXZlcnMvcHBzL3Bw
cy5jCkBAIC03LDE0ICs3LDExIEBACiAKICNkZWZpbmUgcHJfZm10KGZtdCkgS0JVSUxEX01PRE5B
TUUgIjogIiBmbXQKIAotI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KLSNpbmNsdWRlIDxsaW51eC9zY2hl
ZC5oPgogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNsdWRlIDxsaW51eC9pZHIuaD4K
ICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgotI2luY2x1ZGUgPGxpbnV4L2NkZXYuaD4KICNpbmNs
dWRlIDxsaW51eC9wb2xsLmg+CiAjaW5jbHVkZSA8bGludXgvcHBzX2tlcm5lbC5oPgogI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KZGlmZiAtLWdpdCBhL3NjcmlwdHMvYmFzaWMvZml4ZGVwLmMgYi9z
Y3JpcHRzL2Jhc2ljL2ZpeGRlcC5jCmluZGV4IGNkZDVkYTdlMDA5Yi4uZmViOWU3ZDg5ODRkIDEw
MDY0NAotLS0gYS9zY3JpcHRzL2Jhc2ljL2ZpeGRlcC5jCisrKyBiL3NjcmlwdHMvYmFzaWMvZml4
ZGVwLmMKQEAgLTg5LDcgKzg5LDYgQEAKICAqICBidXQgSSBkb24ndCB0aGluayB0aGUgYWRkZWQg
Y29tcGxleGl0eSBpcyB3b3J0aCBpdCkKICAqLwogCi0jaW5jbHVkZSA8c3lzL3R5cGVzLmg+CiAj
aW5jbHVkZSA8c3lzL3N0YXQuaD4KICNpbmNsdWRlIDx1bmlzdGQuaD4KICNpbmNsdWRlIDxmY250
bC5oPgotLSAKMi40My4wCgo=
--000000000000183e26064cb6dbe3--

