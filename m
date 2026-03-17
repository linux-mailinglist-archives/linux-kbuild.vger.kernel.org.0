Return-Path: <linux-kbuild+bounces-12014-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG3fBwI3uWnVvQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12014-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 12:12:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7172A888B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 12:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93840301D4F1
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 11:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6A63A4F3A;
	Tue, 17 Mar 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="psGRM8gh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster4-host8-snip4-2.eps.apple.com [57.103.65.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEE73A4F57
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2026 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745837; cv=none; b=FyrzaF/lVjnAceUa2qnCw2G5otGiCdc12UAlO4tbCBxbWjhXC9D5qvEIhAttqSNQmcAgTdQOZmKLHMnaooIvZ7cMVgf2HvUqDIH5fGsDefGlNypZ86U8Zfm5L9DI4wsKqoOwOZwpApKO+myJjZLo9vRSngm6+Ss38E4j8oFYSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745837; c=relaxed/simple;
	bh=21YqLAarlREa+BS7iy/HFG5WczpJNElRUlfkpq3bWA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r40gI2ZUNxxz3sciw0eMZ3hrJZr6YgWCVOemfCfEXLmFUFfrqNGO8kVH6Tt69CcR+Ps3FBEmDTnpaE8qZNSjCySi8dviti5koltrvE5zh8Rphk+n8rzVeylPbX9yeEZIODYD/VvAgQ52otgW8qw4apBy2nqgA2k3ksqODLzva7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=psGRM8gh; arc=none smtp.client-ip=57.103.65.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-4 (Postfix) with ESMTPS id BB83518003F2;
	Tue, 17 Mar 2026 11:10:33 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773745835; x=1776337835; bh=jvVbkJqvZp193OKwewxAsovndU8csxKL+2yuiPAWtu4=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=psGRM8ghRpGFYdmtpInwr0XwGk2b3QJRg11t9R+Ms6PVAkGbXyPa6vFlzZgxA+vDAjsiqhBkCCwa2y9b9HidEVsoRLFEuX/sA3WuLIFOBBoS7KxsB53etOFM+beWSu7J2W8yTr93wXSGwNoLj8RIBv4AT3cKnJiWH3J6TXKeQeUSF73lNYupmWy+wkAVHlXDzVti3tHbLC7qJz2Byx9HnOSGSMC3yr3KVGrSXn0WUTF2Aml5Fq88mdWx5+p4EERtcdWji1One6H91IR4/dyYu1zfUOzSOQH6l3r5ebcvUkxUEc2EODfD1XZijH5BbcmmTCJgPtxXsw8+I/aRn4JDxA==
mail-alias-created-date: 1772007648188
Received: from sdhn.cc (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-4 (Postfix) with ESMTPSA id A7142180011F;
	Tue, 17 Mar 2026 11:10:30 +0000 (UTC)
Date: Tue, 17 Mar 2026 14:10:27 +0300
From: Mohamad Alsadhan <mo@sdhn.cc>
To: Nicolas Schier <nsc@kernel.org>
Cc: nathan@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	miguel.ojeda.sandonis@gmail.com, linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH v3] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <6gyfvfiiuakmdvk6ja73kad625p52ns36k7rkdhulozthx6jkx@zlmtcljufy3b>
References: <20260227132713.23106-1-mo@sdhn.cc/>
 <20260312002852.11292-1-mo@sdhn.cc>
 <177332343971.79321.12799380648348230294.b4-review@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177332343971.79321.12799380648348230294.b4-review@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5OSBTYWx0ZWRfX13zL8QETY1+Y
 4VQAAk6ZBqOntFDrcw3FhILkYZJtFuZgQPr0mb75YLg3JJhtDUr82WiKeNig5xMeZjDH51MG+vo
 P8I2cB9jroXy72rzSoLQo4+vbW5ko5HR0ziiIVGlI5u2iMDyDAcmHtAFth2Z2HkklyKnrrsLLH2
 oE7Uyz8epgINiVR2+LUZbXHE6gyP0rRNG8RwrWnOov0XyJyGEyz+QqpkDloJXzWxfbWcDzXe3hV
 QXmBZApU9w2wIVHL129yr9YkJnfAX1ucFyAEfoa0JbxMAjIn4Y9d+5xP+7IOyVctsAyeQXIUSU2
 1C5cAF0dGsf6yBclyLCYWYN0JdFwJmKIqiu4v4ff37gBhJgX+YcYtLYmulxPR4=
X-Proofpoint-GUID: gjcEteCvdo---k4nEAJk9ZJdqD2Xoaiw
X-Authority-Info-Out: v=2.4 cv=F79at6hN c=1 sm=1 tr=0 ts=69b936aa
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=-Wk_V9JWSBONsbSvRnAA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: gjcEteCvdo---k4nEAJk9ZJdqD2Xoaiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1030 suspectscore=0 malwarescore=0 adultscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170099
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12014-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sdhn.cc];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,gmail.com,vger.kernel.org,smile.fr];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sdhn.cc:dkim]
X-Rspamd-Queue-Id: 8D7172A888B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/12 02:50pm, Nicolas Schier wrote:
> 
> Why can't we just use this?
> 
>     echo 'exec $(HOSTRUSTC_LD) "$$@"' >> $@; \
> 
> 

I was being extra safe with quoting and escaping to make this as
general as it can be. Just in case a more complex command with some 
shell quoting is passed e.g.
    `HOSTRUSTC_LD="env 'CCACHE_DIR=/tmp/my cache' ccache gcc"`

`sh -c` would reparse it with original quoting and avoid potential 
issues. If you think it's unnecessary, I can change it to the simpler 
version.

> 
> The if_changed macro is not optimal here, as there are no real prerequisites
> for the $(obj)/rustc-wrapper rule but only FORCE, cp.
> Documentation/kbuild/makefiles.rst ("Command change detection").  Thus, the
> rustc-wrapper will always be rebuilt and so always show the 'HOSTGEN' line.
> 
> But you could use filechk instead, e.g.:

Noted, I will update this in v4 to use filechk instead.

Thanks for the helpful comments and suggestions,
Mo


