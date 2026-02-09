Return-Path: <linux-kbuild+bounces-11082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iASBH5afiWlU/wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11082-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:49:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB2310D2F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0B3A30062F0
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 08:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0453C3254B8;
	Mon,  9 Feb 2026 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="psYdizw0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38E242D91;
	Mon,  9 Feb 2026 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626963; cv=none; b=pT0Wqr3jsNYNxSBZ+E/akrPdUjzvyAYXMAJeR8sVoJzRjDwr5Eq3YEMMbGfTLiER40d3Htm3foAkS87upsuJIOLySRor3VvpPa3+lo2HJh6Thpn0AomllHdjUH+bTmJvug63s5nQVVcMKuD//WToq7QEchbn4vDwY82l1YAlQqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626963; c=relaxed/simple;
	bh=3soGnFkrH0m91pNvb5eP4YoQFOgbWeVne8idR8SuM7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hMq8QqKf/AMsQMg4nUO2uIw4bjmspKx2Lc7ANQ5x6T7ND6Ub38i3rFxmNMqrLLTc2iC35J9H+eqf+jG/T+zu0DrgxZ9fjOiMcqNr3ONPs9iRKe/LiB587fI8RhqUNpNgLDF8dfB2RuGeh1vRjGvDEsJwQnSQI+vSlYomZTaeYms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=psYdizw0; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6192BVP6806309;
	Mon, 9 Feb 2026 08:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YnQFQzUNjN2gOs681tQev4rv4hNKCmGJcvC9HKfZE
	vA=; b=psYdizw0Dx/BMqNRdeOGRS5W3yAmhnhr1b3gW00RSzHWB55pmMAjuJlrb
	7sse9ewYEw/s6dpjXaSIyPHz0+dfGhzzEeGGegDTjMgmI7hSoXbUvzfjf+D8CSsh
	oK9hlFFNqszCZ8ahYo/v/RPZCe9uiZvjyRzrk6HJXI6iX7KSINDozMkCYUyIeLIr
	eBD4azhPWplpPgObrBGxhtUUwwxYZ04r7XobCkjXvZEmivB0IX3Ko4SW0c6XbgoP
	RxN5DZibzXioWyeV7nOf5hICpddxyouW5xlHBBHtXFnGCNCPHOY32Old8ohxhV1C
	gCCjpZc0dlaorL77mz4vS2MjqD6EA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696u66d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:48:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61981nLe008390;
	Mon, 9 Feb 2026 08:48:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6g3y4ht7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:48:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198miZW16646538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:48:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF5022004D;
	Mon,  9 Feb 2026 08:48:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F94820040;
	Mon,  9 Feb 2026 08:48:41 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:48:41 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 0/6] objtool: Fixup alternate feature relative addresses
Date: Mon,  9 Feb 2026 14:18:14 +0530
Message-ID: <20260209084820.57298-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=YZiwJgRf c=1 sm=1 tr=0 ts=69899f72 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=1UX6Do5GAAAA:8 a=5NDuelTg4wUFaKIfu4cA:9
 a=IC2XNlieTeVoXbcui8wp:22 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-ORIG-GUID: apd56NP4EAJ9jdsu8g3BvI6cI-gS2um2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfX9bv80hBO5xFh
 m9Pu4YEWTOf4n1Bi0bUD46pNKIz8Mzd/k3uVq7vc/Om4Ial1fkoN/Yy2Vj2d8OFJDTF8GuWu8b2
 QRKnrbiTF/40KYhPKpXHATRN0DMkPEXOdjo5tCjEIzqfXCS8oWR8rfnNU31+oLPFiXho0RdfOZ7
 2mXMf7CSZ7l/zP/JOX/P3gXVUzmx/6OlIPWhto9gR1HwGYAjVkUXEQdZ+9TubBgSsQv+duKNC7q
 X1zZ+xmEl2KX1wduSYvqSH13XlZl0gf92aDGTbdiCr4k6TiLgsNzAATqrYZP+C2W6OpcHcsn4j0
 lcGnYYbjodVM84C6DZm3EfimhQ/+irhcpNIzJaekUdGYrxkEhZbv9bGCNqgiHBd3KV43mGlr3hH
 mgRhuYEp6j5TKS17o00PXVjBLg0hapT+cs25gHMsCFxZD2fSDbiGVNkaRR1/hRBQBTPrqURQT24
 z7/vA+MwAu7lEpBwkdg==
X-Proofpoint-GUID: lh3hroaCX5qepGYOM8XSZXt9j6XEracO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11082-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: ECB2310D2F1
X-Rspamd-Action: no action

This patch series implements build-time fixup of alternate feature
relative addresses for powerpc.

Previously, Nicholas Piggin proposed a build-time solution using a
custom PowerPC tool [1], which provided the foundation for this approach.
The current implementation leverages objtool's existing ELF parsing
infrastructure to do the same.

This patchset applies atop powerpc/merge branch.

Links and History:
[1] Original PowerPC tool approach:
    http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170521010130.13552-1-npiggin@gmail.com/
[2] Initial RFC v1:
    https://lore.kernel.org/linuxppc-dev/20240422092206.147078-1-sv@linux.ibm.com/T/#t
[3] PowerPC instruction decoder borrowed from:
    https://lore.kernel.org/linuxppc-dev/bfa8364da047d8610a09458a1cd924a0566aedbb.1736955567.git.christophe.leroy@csgroup.eu/#Z31tools:objtool:arch:powerpc:decode.c

Testing:
Build and Boot tested on ppc64le, ppc64be, and ppc32be configs.

Changes in V3:
- Split code into individual patches
- Put objtool call into cmd_link_vmlinux
- Move HAVE_OBJTOOL_FEATURE_FIXUP from arch/Kconfig to 
  arch/powerpc/Kconfig 

Changes in V2:
- Added implementation support for ppc64 LE, BE, ppc32 BE.

Sathvika Vasireddy (6):
  objtool/powerpc: Add build-time fixup of alternate feature branch
    targets
  objtool: Set ELF_F_LAYOUT flag to preserve vmlinux segment layout
  objtool: Fix "can't find starting instruction" warnings on vmlinux
  objtool/powerpc: Skip jump destination analysis and unnanotated
    intra-function call warnings for --ftr-fixup
  kbuild: Add objtool integration for PowerPC feature fixups
  powerpc: Enable build-time feature fixup processing by default

 Makefile                                  |   7 +
 arch/powerpc/Kconfig                      |   3 +
 arch/powerpc/Makefile                     |   5 +
 arch/powerpc/include/asm/feature-fixups.h |   2 +-
 arch/powerpc/kernel/vmlinux.lds.S         |   8 +-
 arch/powerpc/lib/feature-fixups.c         |  12 -
 scripts/Makefile.lib                      |   4 +-
 scripts/Makefile.vmlinux                  |   8 +-
 tools/objtool/arch/powerpc/decode.c       |  15 +-
 tools/objtool/arch/powerpc/special.c      | 437 ++++++++++++++++++++++
 tools/objtool/builtin-check.c             |   2 +
 tools/objtool/check.c                     |  42 ++-
 tools/objtool/elf.c                       |   4 +
 tools/objtool/include/objtool/builtin.h   |   1 +
 tools/objtool/include/objtool/special.h   |  56 +++
 tools/objtool/special.c                   |  29 ++
 16 files changed, 611 insertions(+), 24 deletions(-)

-- 
2.43.0


