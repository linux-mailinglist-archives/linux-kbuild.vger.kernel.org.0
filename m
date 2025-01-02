Return-Path: <linux-kbuild+bounces-5314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD1A00192
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 00:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77B48162CF5
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 23:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CC31BEF8C;
	Thu,  2 Jan 2025 23:25:32 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02541BEF75;
	Thu,  2 Jan 2025 23:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735860332; cv=none; b=MLY445iefML3D6YWRGQyvNjDLEMxUz3cRgL39u6ddpOwqzWTzYb4grpujdBdM2TPchXkTuxGWck/rZMzI3GtfIyZ4bDAI3c/wjtec/VTeiZ7oqRHZZsqfUS1H83ZgQwE3ER04sf19C+VC6/qBpwG+WNu/TncCHVV5lsebPNLsBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735860332; c=relaxed/simple;
	bh=vpefdYnotZYqFb3OuaEaxQCVmosOhU+jvix41HPEufg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=YzqCHSyaaKgrumAvjclyJBa68HAii4Buc4Vb3QExPOtTk4xfosPBFJE2rIFmASAeOfBYQi9mHu5Uqc8WX8qyuObG/jIuMKj0aAVkZXzXlB1hensDasD/57A0H6CPqKGeeai2YJelrSFLIy/iByru3Va7USd3ik+wVhMoeKjIlus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE28C4CED0;
	Thu,  2 Jan 2025 23:25:32 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tTUaX-00000005Ysl-1sS3;
	Thu, 02 Jan 2025 18:26:49 -0500
Message-ID: <20250102232649.293540958@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 02 Jan 2025 18:26:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 bpf <bpf@vger.kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Zheng Yejian <zhengyejian1@huawei.com>,
 Martin  Kelly <martin.kelly@crowdstrike.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH v2 04/16] scripts/sorttable: Have the ORC code use the _r() functions to read
References: <20250102232609.529842248@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The ORC code reads the section information directly from the file. This
currently works because the default read function is for 64bit little
endian machines. But if for some reason that ever changes, this will
break. Instead of having a surprise breakage, use the _r() functions that
will read the values from the file properly.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/sorttable.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/sorttable.h b/scripts/sorttable.h
index aa7a8499a516..7c06a754e31a 100644
--- a/scripts/sorttable.h
+++ b/scripts/sorttable.h
@@ -296,14 +296,14 @@ static int do_sort(Elf_Ehdr *ehdr,
 #if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
 		/* locate the ORC unwind tables */
 		if (!strcmp(secstrings + idx, ".orc_unwind_ip")) {
-			orc_ip_size = s->sh_size;
+			orc_ip_size = _r(&s->sh_size);
 			g_orc_ip_table = (int *)((void *)ehdr +
-						   s->sh_offset);
+						   _r(&s->sh_offset));
 		}
 		if (!strcmp(secstrings + idx, ".orc_unwind")) {
-			orc_size = s->sh_size;
+			orc_size = _r(&s->sh_size);
 			g_orc_table = (struct orc_entry *)((void *)ehdr +
-							     s->sh_offset);
+							     _r(&s->sh_offset));
 		}
 #endif
 	} /* for loop */
-- 
2.45.2



