Return-Path: <linux-kbuild+bounces-8978-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE8BA859F
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 10:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DBE517BEE5
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC28241673;
	Mon, 29 Sep 2025 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nd7oY9/w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45C27281E
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2025 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759133143; cv=none; b=RFobpdaJ+tRsF8eW+Wic1f9FMFAqBQlCXcxLMcp2yZ9Yzt/lUAiOP/Epm6a/x+NcRUF4QAjX0ItMvgk3bdYUFsv0GjuxiBAPolpaV8QWs3AEW2zDaLT59kuO+eQHU7mgqa+3qtqOvqz8CWf2UgngMNm5ADEffxB4yS0VO4EHMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759133143; c=relaxed/simple;
	bh=RJMGOtxN9DoUr7+iCCbEtulKaHVk1z93BWHflrgFQe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G/fE4/1YbWyTBX7lcZf0PhWiNNO+tIoiFCWzhVDZU4rpt8oEm3SI/HFJ7aDN2PNp3m24uZCtDNxMXzZltjsbKdEBfE0C1gSIPFx4zdDJ8FmA03UsQ7Avtue5nmrcI9qPIlZEx1DQcf07pn5XC0vOFgvuFBuYWfqAXfNhuSkbCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nd7oY9/w; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SKREwf004212;
	Mon, 29 Sep 2025 08:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=dbV1SZ7GXxizQtp0N8BD8hkbm57dsnMWedqpEM023
	tg=; b=nd7oY9/wO73Z82FNMtCV0xRijwnt6/SsrCyeDG/AdQ3TvbsU44F+26opT
	9IOdDMuq53vKHEFB963oN8L+dqRfRBvAFppnmJJUJ8Zn22nXqmB3ALm6n1+CYny2
	+qDVT4/RABF0PNd/980PmILAhLU4ymn+DekoZ0WgsuJcI0TOyLG96glMhF7KpI/9
	WJpVIjzlS7tHbK7zJqeOgdhiAqikEI8/vDK4OU9zoJyGnvXAotbFQC1JxVOjCuFq
	f+QG2azbbY5yzAGvcnkB205dKH8+XMwVvc6pCrT92Dar+TTWVPYWQwt4rXyZvnks
	goZX+DQLWeqDbL+ltWyzN0s4wST7Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e6bh9104-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:09 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58T818OD004392;
	Mon, 29 Sep 2025 08:05:08 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e6bh9101-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:08 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58T5HOqR001667;
	Mon, 29 Sep 2025 08:05:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49evfhvv47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58T854JA44892558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Sep 2025 08:05:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2504A20040;
	Mon, 29 Sep 2025 08:05:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C63322004E;
	Mon, 29 Sep 2025 08:05:00 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.ibm.com (unknown [9.39.16.189])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Sep 2025 08:05:00 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        mahesh@linux.ibm.com, sv@linux.ibm.com
Subject: [RFC PATCH v2 0/3] objtool: Fixup alternate feature relative addresses
Date: Mon, 29 Sep 2025 13:34:53 +0530
Message-ID: <20250929080456.26538-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Se/6t/Ru c=1 sm=1 tr=0 ts=68da3db5 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=1UX6Do5GAAAA:8 a=5NDuelTg4wUFaKIfu4cA:9
 a=IC2XNlieTeVoXbcui8wp:22 a=Et2XPkok5AAZYJIKzHr1:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxMCBTYWx0ZWRfX/tWPZ6Vw6EGT
 lbO3fssgkBuFyPBjJO2TIDI/RtKh1NgvEbXZ2N1jiXkY6cZx0shc9lBb9nwcKD7L6uZ6uvoS6Ec
 pyuDPWlxvTdX8LchkoUHdkvl3VbUnsdygKO4Jve2pGG4Cvpup7FPxHrCizms0LwkS5eHKJ4V/x3
 MfYbhmPHZB/GSvPsLcmankdKnALr5XJPlGhS6ZvUSaezk8ARUr8avQvD/8SQl37F0AnsplWW4US
 nu8ITYSXlNfUaRnugUIftMPZc9oZ59fIHQcMMTOiUA1NmOpZiGpApujersvjWoiRJlx0CjoUjlq
 wWefvhl1L+R9Kf8XcHwFNoBv9evj13LZVRNn2OmXVBzL4dTe28A78tZa0LpJwcXGKJyCSOxt1+v
 ex3wZl621/Hyzc6ajAwVM21X1BEDXw==
X-Proofpoint-GUID: 6Ik6XAIrR4lbZJA9sA6FY0t21oQOnYt-
X-Proofpoint-ORIG-GUID: V1czuJ3uWPBoAbWS72W3lae0uDhb6wqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270010

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

Changes in V2:
- Added implementation support for ppc64 LE, BE, ppc32 BE.

Sathvika Vasireddy (3):
  objtool/powerpc: Enhance objtool to fixup alternate feature relative
    addresses
  kbuild: Add objtool integration for PowerPC feature fixups
  powerpc: Enable build-time feature fixup processing by default

 Makefile                                  |   7 +
 arch/Kconfig                              |   3 +
 arch/powerpc/Kconfig                      |   3 +
 arch/powerpc/Makefile                     |   5 +
 arch/powerpc/include/asm/feature-fixups.h |   2 +-
 arch/powerpc/kernel/vmlinux.lds.S         |   8 +-
 arch/powerpc/lib/feature-fixups.c         |  12 -
 scripts/Makefile.lib                      |   5 +-
 scripts/Makefile.vmlinux                  |  13 +-
 tools/objtool/arch/powerpc/decode.c       |  15 +-
 tools/objtool/arch/powerpc/special.c      | 436 ++++++++++++++++++++++
 tools/objtool/builtin-check.c             |   2 +
 tools/objtool/check.c                     |  48 ++-
 tools/objtool/elf.c                       |   4 +
 tools/objtool/include/objtool/builtin.h   |   1 +
 tools/objtool/include/objtool/special.h   |  56 +++
 16 files changed, 593 insertions(+), 27 deletions(-)

-- 
2.43.0


