Return-Path: <linux-kbuild+bounces-13720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WKCRLGPzKmq7zwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13720-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 19:41:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F5674181
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 19:41:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=mFbT4hMp;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13720-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13720-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F7CD303956B
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 17:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC5233C194;
	Thu, 11 Jun 2026 17:41:52 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D07279329;
	Thu, 11 Jun 2026 17:41:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199712; cv=none; b=RROjlCGreNbr5Y76tR/17zXEH4+6UwUpqA1F3qW9WcppL215EBsa87Wbbb/hqDwLxg0t/D8I4xy/PtIAfifZ1ZJFXQ7/+waqDXZH0VdV+kMY6MbYV/tNh+tCRe+dF73D8aZr826ORmu/SP6h+8UN34JIdPKoTRKYINKLowk/Lrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199712; c=relaxed/simple;
	bh=JTyNXChaXJLOmBGMt4aMbfEic1VUEIC4U1io9iASaNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1UxpFq3Z8Hn1zVbmbZE5XpxcQorTi/EMJ9R+0Hz/S++NQYDCObQI9Bt9EdHLugCPo2YBfYi8ztwTLoUjUBouOTQB/BXf9UWlXf/TExyaqRdk5Okc/vdPIAoVj8CJll52iYWuTaKHA+6616s/Z3vDzxzrqxcIhojXXEXbpcplQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mFbT4hMp; arc=none smtp.client-ip=148.163.158.5
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCmjsC1741923;
	Thu, 11 Jun 2026 17:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=5LY6Y/13bHPBekH6tW4tqlz2F35W+M
	GiIqWnvari4gE=; b=mFbT4hMpB2bb+wXboX9w0cWd7ioysOqDZbSyscM6jnBVIO
	ZAyl7nlaqvy+KXK3HeZh3203IBL0L+Zj6jFTzLttcXQM8UWDQqVAf7TQ8MLE5jt0
	AIbjK5dzK72PnubkQ9NcRmNx+aTLjyNRjxIH7T1sPI8yUM5r21qI2JkCjAFxOr5o
	ddc599LBBu2nDLAfkk5/0j+NTI/1nxI2XTWqE0krN9jRCPNJb7jRdrZVK3B/yVTz
	7NJwJsZJzjWWzjw54WHvIRyDfkyc98VyJwIzOvOls1WtKo51HyinRzUGvOovSDCE
	Tm7SDyQ1bJtVfrBk8uOQFXk9Bv5Ig7l2uOqiaG3A==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eqe8bmyw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 17:41:02 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65BHYfmk001481;
	Thu, 11 Jun 2026 17:41:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4eqe0a4907-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 17:41:01 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65BHevRg48103902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jun 2026 17:40:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6E732004B;
	Thu, 11 Jun 2026 17:40:57 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6EA120040;
	Thu, 11 Jun 2026 17:40:47 +0000 (GMT)
Received: from shivang.upadyay (unknown [9.39.28.214])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 11 Jun 2026 17:40:47 +0000 (GMT)
Date: Thu, 11 Jun 2026 23:10:44 +0530
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, nathan@kernel.org, nsc@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, jpoimboe@kernel.org, ojeda@kernel.org,
        masahiroy@kernel.org, lossin@kernel.org, tamird@kernel.org,
        thomas.weissschuh@linutronix.de, rostedt@goodmis.org,
        ihor.solodrai@linux.dev, thuth@redhat.com, pmladek@suse.com,
        aliceryhl@google.com, elver@google.com, kees@kernel.org,
        legion@kernel.org, ardb@kernel.org, yuxuan.zuo@outlook.com,
        alexghiti@rivosinc.com, alexandre.chartre@oracle.com, bp@alien8.de,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, shivangu@linux.ibm.com
Subject: Re: [PATCH v1 0/6] objtool: Fixup alternate feature relative
 addresses
Message-ID: <airxFpcQE7kQ5qLK@shivang.upadyay>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505114050.GW3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505114050.GW3126523@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Xfa5Co55 c=1 sm=1 tr=0 ts=6a2af32f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=voM4FWlXAAAA:8
 a=pGLkceISAAAA:8 a=VQAFIG5AJ55ret5aWFUA:9 a=CjuIK1q_8ugA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE3NyBTYWx0ZWRfX7bxoSE+N7m9N
 qrVFc9J4bJsyoR+UUV5Iv/YOYdxhp2rfYtjEMW4d1sOVEXmIe84bdEVnosGlV6qmFXAAAv1iyxq
 XSf1VspSpzwyjfbAjOTHNkTvZcM1oI7+jRrEa/mW4JFzBum+2nc5sZO8pkzYkowyj47735iRcKb
 XoRMPjTmlD/Ho9WwUn7JvzrRCYyQNeA6BNtIjkkCr/u9BooEfmWoLcGFynoSw4SV1BiIvXoy41m
 UgEB5kpKYom6Kb+FCuxGzatgdXxV2KchVO8QMwwXzoKVG7/wgfJ3Iix0v5WmAvh5TSQe4Fh44We
 k1j5wlMUaLlKuagBtU4rlSqgW+XWshHforqRr69Cp00HK5DY4dZ15gamjK9a9T6fa2BD1miJtJf
 ZdYS5VI6Xjb59HCbCGzWrYtee1ffLrfxTtIeX7eCl/91LT4wpPFE7/CDoAvAVx+l4mTTdObNezS
 V2n7Zdduqm+gjTbjT+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE3NyBTYWx0ZWRfXxJWfbXdbB7r9
 rb1UTfRgwmyF0eaIOklBYemeQ3vSCUvLNcq/CXiGxdAK9EEveEinths416A05QAT9QduOoeU+zU
 cOPFRst0+zL5cl8hVoqsgI0Nrsabt18=
X-Proofpoint-ORIG-GUID: 2i9MmL2Gbyt48Nw4JZSkte9JgJ-VXBs5
X-Proofpoint-GUID: L8HjNQPSLLI-3yDX8EVsag5cFCH-QFec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 clxscore=1011 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13720-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:sv@linux.ibm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:jpoimboe@kernel.org,m:ojeda@kernel.org,m:masahiroy@kernel.org,m:lossin@kernel.org,m:tamird@kernel.org,m:thomas.weissschuh@linutronix.de,m:rostedt@goodmis.org,m:ihor.solodrai@linux.dev,m:thuth@redhat.com,m:pmladek@suse.com,m:aliceryhl@google.com,m:elver@google.com,m:kees@kernel.org,m:legion@kernel.org,m:ardb@kernel.org,m:yuxuan.zuo@outlook.com,m:alexghiti@rivosinc.com,m:alexandre.chartre@oracle.com,m:bp@alien8.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:shivangu@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[shivangu@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,shivang.upadyay:mid,linux.ibm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivangu@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 338F5674181

On Tue, May 05, 2026 at 01:40:50PM +0200, Peter Zijlstra wrote:
> On Tue, May 05, 2026 at 02:16:22PM +0530, Sathvika Vasireddy wrote:
> > This patch series implements build-time fixup of alternate feature
> > relative addresses for powerpc.
> > 
> > Previously, Nicholas Piggin proposed a build-time solution using a
> > custom PowerPC tool [1], which provided the foundation for this approach.
> > The current implementation leverages objtool's existing ELF parsing
> > infrastructure to do the same.
> > 
> > This patchset applies atop powerpc/merge branch.
> > 
> > [1] Original PowerPC tool approach:
> >     http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170521010130.13552-1-npiggin@gmail.com/
> > 
> > Testing:
> > Build and Boot tested on ppc64le, ppc64be, and ppc32be configs.
> > 
> > Sathvika Vasireddy (6):
> >   objtool/powerpc: Add build-time fixup of alternate feature branch
> >     targets
> >   objtool: Set ELF_F_LAYOUT flag to preserve vmlinux segment layout
> >   objtool: Fix "can't find starting instruction" warnings on vmlinux
> >   objtool/powerpc: Skip jump destination analysis and unnanotated
> >     intra-function call warnings for --ftr-fixup
> >   kbuild: Add objtool integration for PowerPC feature fixups
> >   powerpc: Enable build-time feature fixup processing by default
> 
> Ooh, so 2/3 are because you're not running objtool on vmlinux.o, but
> you're running it later in the link stage?
> 
> AFAICT ELF_F_LAYOUT should not hurt the normal objtool run, but it
> shouldn't be needed either, because we run much earlier, before sections
> are placed.
> 
> And that also explains why you're the first to have trouble with 'can't
> find starting instruction'. vmlinux.o will have unplaced sections that
> are all relative 0.
> 
> Hmm... perhaps this ftr fixup should be its own command, like klp. Not
> munged into check thing. Josh?

Hi Peter,

As the original author for the patch series will not be working on this
feature anymore, I'd like to take over and move this feature forward.

Your point about only using objtool at object stage, makes sense.
Would you prefer if I rework this as a saperate tool then?

Regards
~Shivang

