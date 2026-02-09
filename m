Return-Path: <linux-kbuild+bounces-11090-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cES4KdsAimluFQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11090-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 16:44:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 251341120FD
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 16:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C9C1305B947
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 15:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310042F7455;
	Mon,  9 Feb 2026 15:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/kb6oeD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289D3793B1
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Feb 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651489; cv=none; b=I3DSZrCpzn/Mv4DMMZ/HovTjlV7p5FYGfxPT3MFNHZK7m4xPrO/gPmTomCVuvoXzgN9CmyBcG27DC9wsylg6haFnQnow62pxa+taTrTUmOQqrH7Ue553YFas0fHHdJPTXf5aRsf6t+1woCV7NvMjnhrm34TlnERy7fKlVOv4Od8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651489; c=relaxed/simple;
	bh=k8L3KQzCnAhs30Fj85oVFwKJSvyqb8KCgp33iA8PQYg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IGOMCbHo0xj7k9qNVB1XPlKUryuzt1ESkVPVyhN9dy9ZxCK0lqnXnWMs4HsunMrpq6NRDhZkmbF/+WqpfzvfxzJpUJ2ksYq6czzWPDoIVEUAvgUlm4gkh2O7V+2oPiwoeU+hVyBPE4a8Ua5wO050JlfWn0MC04mc/h9bJuKClvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/kb6oeD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4377174e1ebso674592f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Feb 2026 07:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770651487; x=1771256287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qEmIRJDm3uUm8EKhoqE5T+3bDP/CkAdKaLHxwbAztk=;
        b=G/kb6oeDN/SUUDzWkQf//CGPRKF5VL4USl7prQ469JhoWA/q2QGyb++vN4rUV+UajQ
         EhLzubx+xDcX8reyoCQUv/pP2s0i5BFbReAHBEs8TFVc2qnBXeQngKtQ+h28KkCXYj7j
         0yqYwTz6N0Nkum+0UB4lDsMPFHYqjpqSN/iHGPndNSx7gQql3mwp5bs1PDHcyWN7/qKr
         zzMa2R28+U6MrwFOQ15u90WUyt9IX7xEsZeMbF6R0xosmmkvIfdUTpS+Nq2qMJFptdap
         rTn+t9MjzhOtfxwcupfpCY0EstEdFjz05n0KSHZbWFdRS3QbUoDE3uCOl1X+cSeMhdSc
         CjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651487; x=1771256287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qEmIRJDm3uUm8EKhoqE5T+3bDP/CkAdKaLHxwbAztk=;
        b=MdMWPH+gz8wynuVYf+Med1BoEpC2slBdftWta64XtzcCQCsNh8YJGnVyurNNGQZ9n+
         SYiA1/7jzfnCvzT4SpHNO8/fky1dgZVATsMsMNFnWpQiZeVXBvsZsylyRPhOMBNY7F+J
         Ilen+I66tCQu4lVP+yDrbV11I08IcYl46doHT7wKxV22LdLC8C4gfcfHSuRu/WHLnahZ
         OgL9/v7u2gYuJYltp1ONVgyQtP9CDRq76vEGVqeYrcFihtKo/Pb/6CfAhRzMdwn8lHla
         I8fMpBOO0xB09+RUuxVmQAvd4aFKhM04jPMYzZMcpD2PABKVKq3ZvEYLOSR43m2rhb7M
         KQ4A==
X-Forwarded-Encrypted: i=1; AJvYcCVYyhVeQ6kWoi/xjoe644+LAjD8KS2KKxkJv1fWQtiBneJ/+kavSIxkaKph/qW2ox6IpM3/SXPtn1kKkSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/R4Gy8QjTCSlWsaOvI/Bp7CPCwFKKGXcjifRrfJgwYONGZgD
	d0o1Ep8CsunlK+YFm3ACi8ZjzL1DZJqlHInsgMq1B51pAwvG9fa16/ML
X-Gm-Gg: AZuq6aK6E2BQ0YnVV4dUMosoulJdCoNV++tc+Cz+5ig/5vKnlN2ctNyu3CbBTPzOBcG
	JM390uMMnfO376yP09rK9DBOV93nKIskC2qiuaPJFXBxMNW6pqPBZyeTvRH9dhxhPAZwJicMBLV
	S46JuAlJC9AVO3Q3I7x5J7t4VxduHeNizSyNUpmAdGB0HbnGjZhUYlwdi36jS2l/sj7g2hlp2Vb
	SduhYri+1qHOdDKbebyBYDcKlns4MeZcrmycDJhFl6M03aGhtCW68+J6kH6ZAOLQApLVouu9Glv
	u2TfJcqkvaIQb3sc8bKkOdZmSTbmb2THXJPhnN50hwPvbr2NNXuCBW9Hx+uHlpFe297jg7FjS+/
	RfshBZgff4s+L/lDSXiLlLSsr5AmzkD5tmQoSDFT+UFnrYeHFRo/GXhcyCFSucBPQ1CUzJ6WHa/
	eNOnm/+eLA0RczeBkY+3yQw8CA6tMRdPD5mjMbBLL9qhYTquqF4cOqcQ==
X-Received: by 2002:a5d:5f82:0:b0:430:96bd:411b with SMTP id ffacd0b85a97d-43629691fedmr16528175f8f.58.1770651486792;
        Mon, 09 Feb 2026 07:38:06 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-125.ip49.fastwebnet.it. [93.34.90.125])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4376d3a32basm10697168f8f.14.2026.02.09.07.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:38:06 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	David Disseldorp <ddiss@suse.de>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] initramfs: correctly handle space in path on cpio list generation
Date: Mon,  9 Feb 2026 16:37:58 +0100
Message-ID: <20260209153800.28228-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-11090-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,suse.de,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ansuelsmth@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gen_initramfs.sh:url]
X-Rspamd-Queue-Id: 251341120FD
X-Rspamd-Action: no action

The current gen_initramfs.sh and gen_init_cpio.c tools doesn't correctly
handle path or filename with space in it. Although highly discouraged,
Linux also supports filename or path with whiespace and currently this
will produce error on generating and parsing the cpio_list file as the
pattern won't match the expected variables order. (with gid or mode
parsed as string)

This was notice when creating an initramfs with including the ALSA test
files and configuration that have whitespace in both some .conf and even
some symbolic links.

Example error:
usr/gen_initramfs.sh: line 97: [: Devkit.conf: integer expected
usr/gen_initramfs.sh: line 97: [: Devkit.conf: integer expected
usr/gen_initramfs.sh: line 97: [: Nexus: integer expected
usr/gen_initramfs.sh: line 97: [: Tab: integer expected
usr/gen_initramfs.sh: line 98: [: A500: integer expected
usr/gen_initramfs.sh: line 97: [: Slider: integer expected
usr/gen_initramfs.sh: line 98: [: WM8903.conf: integer expected
usr/gen_initramfs.sh: line 97: [: Transformer: integer expected
usr/gen_initramfs.sh: line 98: [: WM8903.conf: integer expected
usr/gen_initramfs.sh: line 97: [: Infinity: integer expected
usr/gen_initramfs.sh: line 98: [: TF700T: integer expected
usr/gen_initramfs.sh: line 97: [: Pad: integer expected
usr/gen_initramfs.sh: line 98: [: TF300T: integer expected
usr/gen_initramfs.sh: line 97: [: Pad: integer expected
usr/gen_initramfs.sh: line 98: [: TF300TG: integer expected
usr/gen_initramfs.sh: line 97: [: Pad: integer expected
usr/gen_initramfs.sh: line 98: [: TF300TL: integer expected
usr/gen_initramfs.sh: line 97: [: Prime: integer expected
usr/gen_initramfs.sh: line 98: [: TF201: integer expected
usr/gen_initramfs.sh: line 97: [: 4X: integer expected
usr/gen_initramfs.sh: line 98: [: HD: integer expected
usr/gen_initramfs.sh: line 97: [: Vu: integer expected
usr/gen_initramfs.sh: line 98: [: MAX98089.conf: integer expected

Caused by example file:

/usr/share/alsa/ucm2/conf.d/tegra/Asus Transformer Pad TF300TL RT5631.conf

To correctly handle this problem, rework the gen_initramfs.sh and
gen_init_cpio.c to guard all the path with "" to handle all kind of
whitespace for filename/path.

The default_cpio_list is also updated to follow this new pattern.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 usr/default_cpio_list |  6 +++---
 usr/gen_init_cpio.c   | 10 +++++-----
 usr/gen_initramfs.sh  | 27 +++++++++++++++++++--------
 3 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/usr/default_cpio_list b/usr/default_cpio_list
index 37b3864066e8..d4a66b4aa7f7 100644
--- a/usr/default_cpio_list
+++ b/usr/default_cpio_list
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # This is a very simple, default initramfs
 
-dir /dev 0755 0 0
-nod /dev/console 0600 0 0 c 5 1
-dir /root 0700 0 0
+dir "/dev" 0755 0 0
+nod "/dev/console" 0600 0 0 c 5 1
+dir "/root" 0700 0 0
diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index b7296edc6626..ca5950998841 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -166,7 +166,7 @@ static int cpio_mkslink_line(const char *line)
 	int gid;
 	int rc = -1;
 
-	if (5 != sscanf(line, "%" str(PATH_MAX) "s %" str(PATH_MAX) "s %o %d %d", name, target, &mode, &uid, &gid)) {
+	if (5 != sscanf(line, "\"%" str(PATH_MAX) "[^\"]\" \"%" str(PATH_MAX) "[^\"]\" %o %d %d", name, target, &mode, &uid, &gid)) {
 		fprintf(stderr, "Unrecognized dir format '%s'", line);
 		goto fail;
 	}
@@ -244,7 +244,7 @@ static int cpio_mkgeneric_line(const char *line, enum generic_types gt)
 	int gid;
 	int rc = -1;
 
-	if (4 != sscanf(line, "%" str(PATH_MAX) "s %o %d %d", name, &mode, &uid, &gid)) {
+	if (4 != sscanf(line, "\"%" str(PATH_MAX) "[^\"]\" %o %d %d", name, &mode, &uid, &gid)) {
 		fprintf(stderr, "Unrecognized %s format '%s'",
 			line, generic_type_table[gt].type);
 		goto fail;
@@ -322,7 +322,7 @@ static int cpio_mknod_line(const char *line)
 	unsigned int min;
 	int rc = -1;
 
-	if (7 != sscanf(line, "%" str(PATH_MAX) "s %o %d %d %c %u %u",
+	if (7 != sscanf(line, "\"%" str(PATH_MAX) "[^\"]\" %o %d %d %c %u %u",
 			 name, &mode, &uid, &gid, &dev_type, &maj, &min)) {
 		fprintf(stderr, "Unrecognized nod format '%s'", line);
 		goto fail;
@@ -527,8 +527,8 @@ static int cpio_mkfile_line(const char *line)
 	int end = 0, dname_len = 0;
 	int rc = -1;
 
-	if (5 > sscanf(line, "%" str(PATH_MAX) "s %" str(PATH_MAX)
-				"s %o %d %d %n",
+	if (5 > sscanf(line, "\"%" str(PATH_MAX) "[^\"]\" \"%"
+				str(PATH_MAX) "[^\"]\" %o %d %d %n",
 				name, location, &mode, &uid, &gid, &end)) {
 		fprintf(stderr, "Unrecognized file format '%s'", line);
 		goto fail;
diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 7eba2fddf0ef..13f2219a1ce9 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -103,7 +103,8 @@ parse() {
 
 	case "${ftype}" in
 		"file")
-			str="${ftype} ${name} ${location} ${str}"
+			printf "%s \"%s\" \"%s\" %s\n" \
+				"${ftype}" "${name}" "${location}" "${str}" >> $cpio_list
 			;;
 		"nod")
 			local dev="`LC_ALL=C ls -l "${location}"`"
@@ -113,19 +114,20 @@ parse() {
 
 			[ -b "${location}" ] && dev="b" || dev="c"
 
-			str="${ftype} ${name} ${str} ${dev} ${maj} ${min}"
+			printf "%s \"%s\" %s %s %s %s\n" \
+				"${ftype}" "${name}" "${str}" "${dev}" "${maj}" "${min}" >> $cpio_list
 			;;
 		"slink")
 			local target=`readlink "${location}"`
-			str="${ftype} ${name} ${target} ${str}"
+			printf "%s \"%s\" \"%s\" %s\n" \
+				"${ftype}" "${name}" "${target}" "${str}" >> $cpio_list
 			;;
 		*)
-			str="${ftype} ${name} ${str}"
+			printf "%s \"%s\" %s\n" \
+				"${ftype}" "${name}" "${str}" >> $cpio_list
 			;;
 	esac
 
-	echo "${str}" >> $cpio_list
-
 	return 0
 }
 
@@ -156,8 +158,17 @@ dir_filelist() {
 
 		echo "${dirlist}" | \
 		while read x; do
-			list_parse $x
-			parse $x
+			# Reverse progressive matching to handle path
+			# with space (last arg)
+			gid=${x##* }
+			x=${x% *}
+			uid=${x##* }
+			x=${x% *}
+			mode=${x##* }
+			path=${x% *}
+
+			list_parse "$path" "$mode" "$uid" "$gid"
+			parse "$path" "$mode" "$uid" "$gid"
 		done
 	fi
 }
-- 
2.51.0


