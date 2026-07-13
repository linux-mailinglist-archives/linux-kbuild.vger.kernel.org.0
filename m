Return-Path: <linux-kbuild+bounces-13994-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id erv/JzLXVGqtfgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13994-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 14:16:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B6074AD64
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 14:16:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13994-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13994-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=fritz.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 147F83015878
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 12:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9BA37EFE3;
	Mon, 13 Jul 2026 12:16:32 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4E52475D0;
	Mon, 13 Jul 2026 12:16:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944992; cv=none; b=JKvNAJ//A6KDNgWMzQqUGzyhElWIkbpFqxCShoB90RnDywWaf6Ir7pH/d05klCwmGjlj5LCMS7tghbPymqvsURsonVCSiM4dknd7f3BCtkmlwpJz6ycPXKzNRJrHCWrK0kQhdiiAokZV/grJ+kCPoH8tUd1pxDsLRmmaLhPdFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944992; c=relaxed/simple;
	bh=c1eld/fe5D0RuyWGTbnnae/aZMfXSzC6HcbmV5hl7GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiywXYC0PPNH60/1kefPIHwT8XgUWq7hsJ9ZuDSKb+afRZtl1Z7L2e6WNhtqzP69+e/QU2Q5r1yr1pnq0qKFNXqMlj2XfOfDQ3gc6wf7tvu8lieLhnsnhxU0NehuNVay3wx0pkt5uK5kSRE3SkTtMJFsJlY7TUSBNlHNWZOfh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.94
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a54d71c-1649-7f0000032729-7f000001b8b8-1
	for <multiple-recipients>; Mon, 13 Jul 2026 14:16:28 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon, 13 Jul 2026 14:16:28 +0200 (CEST)
Date: Mon, 13 Jul 2026 14:16:27 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Gustavo Luiz Duarte <gustavold@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Breno Leitao <leitao@debian.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scripts: kconfig: merge_config.sh: keep temp file in
 the output dir
Message-ID: <20260713-practical-orange-doberman-a1baf7@l-nschier-aarch64>
References: <20260710-merge_config_output-v2-1-8be3de601612@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-merge_config_output-v2-1-8be3de601612@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1783944988-A8CDEB3F-0D65D6C3/0/0
X-purgate-type: clean
X-purgate-size: 779
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: queueID: 7C64AA0261
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[fritz.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gustavold@gmail.com,m:nathan@kernel.org,m:leitao@debian.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13994-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,fritz.com:email,fritz.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11B6074AD64

On Fri, Jul 10, 2026 at 07:03:33AM -0700, Gustavo Luiz Duarte wrote:
> merge_config.sh currently creates a temporary file in the current
> directory. Create it under $OUTPUT instead, which allows running the
> script against a read-only source tree.
> 
> The default behavior is unchanged: $OUTPUT is "." so the file stays in
> the cwd.
> 
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
> ---
> - Link to v1: https://lore.kernel.org/r/20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com
> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Tested-by: Nicolas Schier <n.schier@fritz.com>

