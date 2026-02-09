Return-Path: <linux-kbuild+bounces-11086-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IrPLKefiWlU/wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11086-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:49:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 745C410D337
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 959A23018428
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 08:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CC0326933;
	Mon,  9 Feb 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UjmE4si6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421B325739;
	Mon,  9 Feb 2026 08:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626968; cv=none; b=rCRV8sAugloEP9hUpiPsLyD4SlyJfevJwVYLBf1z/F2y8B42upU6DE6mAwmuKYs1cLW39CuwlV/htPnlR/GZO9MXRPvBsJdxq2axPrZ/uwyq2vBKUUnIbpQbvYyaEaqBm0H3yesEOO0brCFbTma6HjNDgRT1N+NEOxMNZlYpTOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626968; c=relaxed/simple;
	bh=EK0kl/a1X7J0JjHj++vnoGQyx+UTLm/vBmGL7BYB6fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8ZZ6kPwakizA5SkK1rpPFNjhfvSOHa9UL7xRl3RS1bF/1bGTF/QUexswmI86PVIu0Mkh2I0JwjFpfHCTVcHrHwtaq2qFBwhyVxyvEhh6bjoEp3p+5gpcmM+fItutPyFOCP5dhuY4U3OEkrtfhzUm4/1GL8xqmetP2tj7+wFc54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UjmE4si6; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618LtJwu331321;
	Mon, 9 Feb 2026 08:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mdZpntruiqLsnnXGW
	S5ds3iTzhGltfz08W0xIBP0Nis=; b=UjmE4si6ptdCGowetvoQvw1lR2DXJVSol
	xqMJSTwQVyLe6yBnvGw5kUg6IZdMvpoDOqj6F5rGMeN+G1J36j+rTIEEf15IuHki
	VavkbtG4UxeNUCMQuJBm/rQ7gVpfNVCrvpCtk9XeNRhPYwPJnUkcXKw9RgPW7dr7
	nxeSiNiVxH8e2E1nny2aRrLG/95kvkBZdy5XSKxJF4cmBH/oeqM2A9l8h7hNwOGG
	rIblDImAYJrT9NUKp5HXB0cb8UNlnnuzT/YhKtDwApmBqtSYPygpLZtULyVS/sBI
	35UJ/++zNkEshykaQYR5fmHg8BwGkd0hVhWHK+wyBcdAZBH8EJhaw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696uvyee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6194oHie001825;
	Mon, 9 Feb 2026 08:49:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6je1v5kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:02 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198mwWX28967506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:48:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF56220040;
	Mon,  9 Feb 2026 08:48:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2AAF2004D;
	Mon,  9 Feb 2026 08:48:54 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:48:54 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 3/6] objtool: Fix "can't find starting instruction" warnings on vmlinux
Date: Mon,  9 Feb 2026 14:18:17 +0530
Message-ID: <20260209084820.57298-4-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260209084820.57298-1-sv@linux.ibm.com>
References: <20260209084820.57298-1-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 1TPwQzylPSvBZ7eiikEEW4WWFGapK_b2
X-Proofpoint-ORIG-GUID: qqryV2YEGOyoLgrM3ibQWZzp4u3dBsrU
X-Authority-Analysis: v=2.4 cv=JdWxbEKV c=1 sm=1 tr=0 ts=69899f7f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=7w6QjbFeSYXBFb6lQ1YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfXymowdVw2GDQG
 O0mtY8q6Wb9N/x71F23493QWqd4SqoRc28duIC3MHZGIRZD5t+z+qPbxds5IFrsnZ6Qmfd1PiQP
 lCaP0YdJC9TuvPIwq7eRg5O1z/T2RTlcKc+M5sV/dAG7aktkO6z0GvLrj1lXmUkCNLer4Dl9RIe
 vumxk2Bu0QsrEPfeGb94BrWam3XYAMB8WnLBV9/TLLH/kgBOaRBkFWFCt47t8+3Yq9D3+9NkFVS
 35bZlC616cbPvvNEXwkHMncpjPYfGy6UqmSj4dUpAlQaQV8WolmCV/ciM6ujFwxaOhnzUSYfytH
 6h/RM0Vl+DZS0oHZQKFcbA8dgKok0uNdpctUvTglu5oBfC0VoI/TN72kJHCoOdpu+1gmlqCxnji
 lZoCmRJS2S/GefWlNlKJMi7ZsQT/r9iaj8mFJdrMAs0fTwBmYE9za24VobBL8q9TI54HnOyFIxP
 1pWa+EELaoh6hfvfeEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11086-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 745C410D337
X-Rspamd-Action: no action

Objtool throws a lot of can't find starting instruction warnings
when run on vmlinux with --ftr-fixup option.

These warnings are seen because find_insn() function looks for
instructions at offsets that are relative to the start of the section.
In case of individual object files (.o), there are no can't find
starting instruction warnings seen because the actual offset
associated with an instruction is itself a relative offset since the
sections start at offset 0x0.

However, in case of vmlinux, find_insn() function fails to find
instructions at the actual offset associated with an instruction
since the sections in vmlinux do not start at offset 0x0. Due to
this, find_insn() will look for absolute offset and not the relative
offset. This is resulting in a lot of can't find starting instruction
warnings when objtool is run on vmlinux.

To fix this, pass offset that is relative to the start of the section
to find_insn().

find_insn() is also looking for symbols of size 0. But, objtool does
not store empty STT_NOTYPE symbols in the rbtree. Due to this,
for empty symbols, objtool is throwing can't find starting
instruction warnings. Fix this by ignoring symbols that are of
size 0 since objtool does not add them to the rbtree.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/check.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 667d95431793..92fe5dc05cdb 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -492,7 +492,11 @@ static int decode_instructions(struct objtool_file *file)
 			if (func->embedded_insn || func->alias != func)
 				continue;
 
-			if (!find_insn(file, sec, func->offset)) {
+			if (func->len == 0)
+				continue;
+
+			if (!find_insn(file, sec, opts.ftr_fixup ?
+					func->offset - sec->sym->offset : func->offset)) {
 				ERROR("%s(): can't find starting instruction", func->name);
 				return -1;
 			}
-- 
2.43.0


