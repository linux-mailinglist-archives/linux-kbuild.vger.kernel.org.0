Return-Path: <linux-kbuild+bounces-12112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP4VKO2xvmmAXQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12112-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 15:57:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166D2E5EA3
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 15:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC1E63009149
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 14:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EA339184E;
	Sat, 21 Mar 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="NzVizFiR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster4-host6-snip4-4.eps.apple.com [57.103.65.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7D2BE7BE
	for <linux-kbuild@vger.kernel.org>; Sat, 21 Mar 2026 14:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105065; cv=none; b=aSeViKNreRySWrUVQe4MhbE+LeZF0mAUrqxq8XRkUMOw+HiLYUyTwg46BnvVT0yII8NyqlUrxU4f49QWBuLUA3kjxK3jrtZlYtklugGchrlqlowC5nyrpQko3/4eh2Mf6mAfl1cPTCFXK+XM7CVcdEamacx1uThYr7EQgLBmzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105065; c=relaxed/simple;
	bh=wECRI3GScD5OURjNa3QugB5vnAFlTuk/aYDZixX5+wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfTEthPVhALcq+ZZZKHHGnpxFc2mXrPjJqproHxNe3IFu4DBK+H5hlcdQ3m3rDLcW75HMuWx+zgKEPeD+YH3bwDe9deXVpft/EAenpA5GnFNNKaE8tEspPWfp0n0465t4vRI5JGhAtm04SpyKp5HEM9O4JdIXH8zOSnNJIbuUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=NzVizFiR; arc=none smtp.client-ip=57.103.65.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-10 (Postfix) with ESMTPS id 8836C1800576;
	Sat, 21 Mar 2026 14:57:41 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1774105063; x=1776697063; bh=e2ugbyLUl/HdW9x6XzLEBabbRfM3Z3bI7hRm6Wh7pr8=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=NzVizFiRc6JKjDGeOruR+khxlZOIavTC86GKwKsDl3WBTBLiJ3cF56zlkPxrwByHJPjBIPTRga1aVJ5rgFyaHK/TTTLF0D8qaRSl8pVUOrhavSKn2+Yl8JXgWoJfGKb0jCepjcLrSRCxraYyrMIaLwDIM2Ff6Zbc7PR4j4SIKLqyTvDYGJlBlLXvVKDAY8+PgT/0V2Pw6IOJezQNEAgWaicjrZ8E7lRMSqt/cVt4VBhl1j6P6CJT8LYRkLlwdMtyXddFml06B+/vXxwGgdYqO6b2uM3qSmOwsBSCpxgGkKToHnzKNuH36rChXnjJQQeK3gPEctdrkr5rh7rYgbfLzQ==
mail-alias-created-date: 1772007648188
Received: from sdhn.cc (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-10 (Postfix) with ESMTPSA id AC911180023F;
	Sat, 21 Mar 2026 14:57:38 +0000 (UTC)
Date: Sat, 21 Mar 2026 17:57:35 +0300
From: Mohamad Alsadhan <mo@sdhn.cc>
To: Nicolas Schier <nsc@kernel.org>
Cc: nathan@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	miguel.ojeda.sandonis@gmail.com, linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH v4] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <cb6ctx3mnnlwk6ti3slhne6hu3drvobqomyadlkh2yurkmxvrm@x5l7uxbbbbrz>
References: <20260312002852.11292-1-mo@sdhn.cc>
 <20260317112021.14353-1-mo@sdhn.cc>
 <abzuCFiO3mB3nUM_@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abzuCFiO3mB3nUM_@derry.ads.avm.de>
X-Proofpoint-ORIG-GUID: EyjB93vY-_W8-i0QofM6OnfZxpX37EDT
X-Proofpoint-GUID: EyjB93vY-_W8-i0QofM6OnfZxpX37EDT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDEyNiBTYWx0ZWRfX7B/agAnUAQxX
 Ie0KPrpkRHx5jdPJPgnZcONJcxqa1aehX9cm0I/c9r5cRWmYa9pjyV5EXSE8GH2E/kvKkJ+CQZS
 PrR2K7nupPEPanvrEtpBI5sUifvCL5eC3EV5f9gHtO4/rAw6b81/CnyPQmp6UU5q08IaVuuFH8y
 YKJR37NgjxbNE7rP6mvl61bXn11wZA2kwhi340i9i4qLdsyzMSIBbL/HRUXNnPqo5ELnHNEbQzI
 EbpIG/QvXOGxmR8A50mgbPVTCCtfMBbZQcwridNq6n/LU0GZXTN4i+GIxkv1AXalh5KAeBxvKse
 /10v/i3mvPs6TxkVar6AkIg4789VpP4dsKN81OXnRfDUpZGuwa64ePho3pRXZM=
X-Authority-Info-Out: v=2.4 cv=e/YLiKp/ c=1 sm=1 tr=0 ts=69beb1e6
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OEuUbZ52XjsABei2ZIYA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=881 lowpriorityscore=0
 mlxscore=0 clxscore=1030 suspectscore=0 phishscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603210126
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12112-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sdhn.cc];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,gmail.com,vger.kernel.org,smile.fr];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sdhn.cc:dkim]
X-Rspamd-Queue-Id: 0166D2E5EA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/20 07:51am, Nicolas Schier wrote:
> 
> This printf-based solution needs some more tweaking to also support
> complex commands in HOSTRUSTC_LD with quoted spaces.  A straight forward
> way could be:
> 
> 	'exec sh -c '\''exec "$$0" "$$@"'\'' $(call escsq,$(HOSTRUSTC_LD)) "$$@"'
> 
> to escape single quotes within HOSTRUSTC_LD.  Then the complex example
> from v3 works again (make HOSTRUSTC_LD="env 'CCACHE_DIR=/tmp/my cache' ccache gcc").
Thanks for pointing it out, I should've retested more thoroughly.

> I am still not seeing a benefit in calling usage of 'exec' and 'sh -c'.
> If we'd skip both, there would be no need to use 'env' for environment
> updates:
> 
> 	'$(call escsq,$(HOSTRUSTC_LD)) "$$@"'
> 
> But I may be missing something here.
I was trying to make it as general as possible, e.g. for commands with
shell magic, but I honestly can't make up a plausible use case for
that. We can just go with the simple solution as it also doesn't need
`env`.

I'll send the v5 patch with fix for quoted spaces and the simpler
command.

Best regards,
Mo

