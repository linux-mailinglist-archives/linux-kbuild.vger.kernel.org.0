Return-Path: <linux-kbuild+bounces-13449-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iObZEXz3HWoFgQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13449-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 23:19:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A095E625849
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 23:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A8243033D2A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 21:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F83136607C;
	Mon,  1 Jun 2026 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3ipgcmU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4ED34C124
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780348762; cv=none; b=VMJNKvpNBgBYa2GxlHWM2WuCJofUckFZbdk/kJrQzPtBw9LviR1W2C0VWD4bH4evPc1tHY1BLwBg6BEClLMJlDDFiVMkoVI1INThyaWJ5lYeduOXxF0UkG2kA7QoD9t5B7z3xUNlkT0gsse/oLASuCGFTXj3XNCYbNsZH/y3uT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780348762; c=relaxed/simple;
	bh=IfPIiZW0gCIHgOF0/+IIrxBC8ZG3r9xHJsxK0+0F0kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tex8rxZlxJKCZoLiWh/z35bQMliLzs+b8wuzBCw9pEesfKHSxwvM3MUUiTbU44gzRTBZ3sPZyl1N/6tJrExsa3N2vvASkEqjtfU3d+BIE3FuKWFPch5esYDttdbFIz76u3KtGx96bcsxMe/cDXeUP1xr4ZIlEFfkNvQf8p8M+wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3ipgcmU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1877574f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2026 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780348758; x=1780953558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuVHAspRZOzT54Q3CeGYfhWxBcncLtAKm4G7e3ZGvNU=;
        b=o3ipgcmUluH9ud6bWumsrmuDdH9Gtfcr7BDcN1KYANa/V7Wyrm0ZVKSPv/9tWDyiPf
         4wt8MHAgTn2cIT3CPJ+zDvhzP6OeLiSMnGVEcUMK2Urcxi0Mzdj439ocdQqDtvOFBb3D
         YSdRJfc0PKf4SLJhXWipVSQr5uSt3RgB48vKJfH2WzinHUmvphwqPqEioWQQduieJ/x4
         B6JmYc9s84jSJAuZzTqA+lqeEth4SUky09gKVQRykYU2MsCu2pEAT0FxVj9iNhvr9Vr+
         Z75yW6cD0C5m+fDElR2DU+dpqjFAcyud7fGJ3g0NAwB1jw4nv4i4RSV2hQdqxh2HlAOG
         5hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780348758; x=1780953558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JuVHAspRZOzT54Q3CeGYfhWxBcncLtAKm4G7e3ZGvNU=;
        b=B5kDVb7QxtCkAkKPY+qeUkIp5zBay1igBZ2Dc3lT5UM9OyFP1F1QGcpk6oJUrDTXX4
         8LxtKrntQmPTXfS0lzHvnLN8dce9A5cJemPd/+3bgVe/LxYD50r6/WPXKfQ35bUu2vmt
         JTQzZRLC6teOocNO8yJYmQW3AxwwSCHpTcYsWq3LNIOcRlDY/mnv2/HgQDnx6sOIvvJe
         cWGEnc+jLmzd19XQ4mNkztBt5pDcBrbF+O1Jh1INhr97ci9zIKdtYciduSCk9A/vTd0t
         XgE2ZFemW0XE2N5e0tVnjM+kVi/69FmaG4QHIRQe1j2Dt/76YpS6kuqnS5NAVM61UCdu
         ynVA==
X-Forwarded-Encrypted: i=1; AFNElJ9HeKXOpped+R34e2QHcgyM17SOHhIoTdt8f+GCPTdaQx9cdfs3xGo2TFEERlpE2sw5GS1Cz5vIlfu39ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmggxZaSkSiTNsT3WlgwNOqlby1S8ziCTw3CVuIY4IUlfUZ/FF
	lE6Y0/NcHFAkQNxAsUHDwcl5hSPmzcTaIPHX8FkhYkrtLasLvFRGkJQb
X-Gm-Gg: Acq92OFM0x87u0P6l2g3EdFGWXJBmKdl0ask6OKB1h5BIetg40CF39kqUjmQyypGSC3
	S8pxWAlqwvdEy0hUCF9u7UwGg121jGFemdkonfW7crvx/iF0S/5RxZaD3JmAZ2VY6Z2rXWX7Qyy
	6f3pBClhs4j0xnecBCrJEdWQpl/0agKzjcn+SKFB3I9aRgXlAT2CEx6rNwd6DYq6+gep7J+UwWs
	DESkC26gaeyKsgfR9D/xxfio2NZ076byWHdVzxmRHiB/mUGKxLFn4NEYzV6Pf/EC/uz+SkyrNdG
	JrILDdiuoQfGQTNTFG0txvpZFm83TX/YK1yV6VvN2C/RK8awcUyZzCbklxxkRlPi5hO7x19JMFA
	EMbJx9uojw/NC8iSZaxTl6zN9D28cklTnxkw/LGCVe6PqxHWYrcSmaXg47Fc3HK93Dz3VJayecP
	Sv78miBTq3p3syGmv13E220fiflLflhfsrPTvqsuKbQietXe0CJzHoWmA=
X-Received: by 2002:a05:6000:4b02:b0:45f:1bd:a053 with SMTP id ffacd0b85a97d-45f01bda1famr19783269f8f.1.1780348757529;
        Mon, 01 Jun 2026 14:19:17 -0700 (PDT)
Received: from localhost (a89-182-201-205.net-htp.de. [89.182.201.205])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef3587072sm28494538f8f.34.2026.06.01.14.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 14:19:17 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH v3] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope" command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
Date: Mon,  1 Jun 2026 23:18:50 +0200
Message-ID: <20260601211850.3378-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CANiq72mBkBxGk4CbTrjeNYZ5ZUsD=wVfLVyP2Bcm_v9BExQaGQ@mail.gmail.com>
References: <CANiq72mBkBxGk4CbTrjeNYZ5ZUsD=wVfLVyP2Bcm_v9BExQaGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13449-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A095E625849
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PROBLEM

(1) When executing the command `make COMPILED_SOURCE=1 cscope`, the
`cscope.files` file generated by it includes filenames with the
extensions *.rlib, *.rmeta, and *.so (taken from *.cmd files, which, in turn,
are generated from *.d dependency files by the `fixdep` utility).

(2) When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

SOLUTION

(1) Modify the regular expression in the `all_compiled_sources()` function so
that only files with the extensions *.h, *.c, *.S, and *.rs are accepted.

This causes `make COMPILED_SOURCE=1 cscope` command to generate the
`cscope.files` file that contains only files with the extensions *.h, *.c, *.S,
and *.rs.

(2) Modify the functions `find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` so that they no longer
accept the filename pattern as the last argument, but instead retrieve it from
the new variable `pattern` (analogous to the variables `ignore`, `prune`, and
`tree`) which includes *.rs along with *.h, *.c, *.S.

This causes `make cscope` command to generate a `cscope.files` file that
contains *.rs files along with *.h, *.c, *.S

Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

Changes since V2:
https://lore.kernel.org/lkml/20260530085821.19689-1-litvindev@gmail.com/

- The functions find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` have been modified rather
than having their calls duplicated to avoid redundant directory
traversals (suggested by Sashiko).

– The regular expression in the `all_compiled_sources()` function was improved
by adding a lookahead anchor (?=\s) to the first branch (also suggested by Sashiko).

Changes between the V1 and V2:
https://lore.kernel.org/lkml/20260530085821.19689-1-litvindev@gmail.com/
https://lore.kernel.org/lkml/20260530070631.14955-1-litvindev@gmail.com/

- In Version V1, the `-name` parameters to the `find` calls in the functions
`find_arch_sources()`, `find_arch_include_sources()`, `find_include_sources()`,
and `find_other_sources()` were replaced by `-regextype posix-extended
-regex`. However, as noted by Sashiko, the `-regextype` option is a GNU-specific
extension; therefore, in V2, duplicate function calls were introduced instead.
---
 scripts/tags.sh | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..be7c2ffd2d4e 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -12,6 +12,9 @@ if [[ "$KBUILD_VERBOSE" =~ 1 ]]; then
 	set -x
 fi
 
+# sources to searh
+pattern="( -name *.[chS] -o -name *.rs )"
+
 # RCS_FIND_IGNORE has escaped ()s -- remove them.
 ignore="$(echo "$RCS_FIND_IGNORE" | sed 's|\\||g' )"
 # tags and cscope files should also ignore MODVERSION *.mod.c files
@@ -52,7 +55,7 @@ find_arch_sources()
 	for i in $archincludedir; do
 		local prune="$prune ( -path $i ) -prune -o"
 	done
-	find ${tree}arch/$1 $ignore $prune -name "$2" -not -type l -print;
+	find ${tree}arch/$1 $ignore $prune $pattern -not -type l -print;
 }
 
 # find sources in arch/$1/include
@@ -61,14 +64,14 @@ find_arch_include_sources()
 	local include=$(find ${tree}arch/$1/ -name include -type d -print);
 	if [ -n "$include" ]; then
 		archincludedir="$archincludedir $include"
-		find $include $ignore -name "$2" -not -type l -print;
+		find $include $ignore $pattern -not -type l -print;
 	fi
 }
 
 # find sources in include/
 find_include_sources()
 {
-	find ${tree}include $ignore -name config -prune -o -name "$1" \
+	find ${tree}include $ignore -name config -prune -o $pattern \
 		-not -type l -print;
 }
 
@@ -78,21 +81,21 @@ find_other_sources()
 {
 	find ${tree}* $ignore \
 	     \( -path ${tree}include -o -path ${tree}arch -o -name '.tmp_*' \) -prune -o \
-	       -name "$1" -not -type l -print;
+	       $pattern -not -type l -print;
 }
 
 all_sources()
 {
-	find_arch_include_sources ${SRCARCH} '*.[chS]'
+	find_arch_include_sources ${SRCARCH}
 	if [ -n "$archinclude" ]; then
-		find_arch_include_sources $archinclude '*.[chS]'
+		find_arch_include_sources $archinclude
 	fi
-	find_include_sources '*.[chS]'
+	find_include_sources
 	for arch in $ALLSOURCE_ARCHS
 	do
-		find_arch_sources $arch '*.[chS]'
+		find_arch_sources $arch
 	done
-	find_other_sources '*.[chS]'
+	find_other_sources
 }
 
 all_compiled_sources()
@@ -100,7 +103,7 @@ all_compiled_sources()
 	{
 		echo include/generated/autoconf.h
 		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+|(?<== )\S+[^\\](?=$)' {} \+ |
+			grep -Poh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
-- 
2.54.0


