Return-Path: <linux-kbuild+bounces-12089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAj4KXLuvGme4gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12089-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 07:51:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6862D6573
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 07:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD0A4306B2C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 06:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D902355F3F;
	Fri, 20 Mar 2026 06:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xsa37oDr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDA22F1FFE;
	Fri, 20 Mar 2026 06:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989488; cv=none; b=KEXWfeDqTPCz1um3cMjnDq8r/Zxs+40LvwdCcWo/6+cDtfeC/qRi7jC5qrna53gRZYBLB2RrMya+ZBLz1xvNJ4KWP+F7nLy3Le9XVCRpc2jLnSUIixCnmaw+X4WX22s0U0VTnz5n/5pcQ/7VPrBS4zZ/gFUk/rQpNw5KTKW2zpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989488; c=relaxed/simple;
	bh=sPAyR6UEYmDQLBHgfdoRYDb/hku4FV9r/s9SOF6co9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPMBcobkVLMMrBaAcu5vdwcK5F7LI0EaIwTthMe9adfRCZDpjiU6tuOomlaZqNc6G+LkYEeeHITuP/eN3GUfXJoAIziOlFIpFWVFurzR/ECNaqmL5uzbbXKZLAsNu5T1My4MkChkAXw9HEk8oW3Q2sdI9eXSLIdl1Z7S1K0n2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xsa37oDr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3AAC4CEF7;
	Fri, 20 Mar 2026 06:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773989487;
	bh=sPAyR6UEYmDQLBHgfdoRYDb/hku4FV9r/s9SOF6co9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xsa37oDr8/BEHQSQhUU2XuYFpo8kh79z95RhMZglSUeV1LmD9PGOaUpw434xyK1O1
	 DIKnKLqYyUj7vrKxKXc2NQG7RIWil5LcOh6/4HYxNzkmL2Prlj3JhEaNAvf4mOEenJ
	 YFmCnuJQPX+MuCKb1rDZaOgEAt6G4O7ykiPOPt+Jv7yvX+oTg7qjAG9cJmm0HWTj07
	 xajfOIrEMYXwSfz3ZateD4mRXB6/1r4l1OBzTyZ+Nm9Pw27xJiRWWu84IagBG7JxbZ
	 TDtA5Mk9UCcq7lWIPrEfW89v2n1s4gjE9B6JQTuH1jbaHcVKfvEFTjhaGC6+p0MfWX
	 OnQe3nH+svImg==
Date: Fri, 20 Mar 2026 07:50:15 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, ojeda@kernel.org, gary@garyguo.net,
	miguel.ojeda.sandonis@gmail.com, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH v3] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <abzuJ9vWuvgRKUI5@derry.ads.avm.de>
References: <20260227132713.23106-1-mo@sdhn.cc/>
 <20260312002852.11292-1-mo@sdhn.cc>
 <177332343971.79321.12799380648348230294.b4-review@kernel.org>
 <6gyfvfiiuakmdvk6ja73kad625p52ns36k7rkdhulozthx6jkx@zlmtcljufy3b>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6gyfvfiiuakmdvk6ja73kad625p52ns36k7rkdhulozthx6jkx@zlmtcljufy3b>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12089-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,gmail.com,vger.kernel.org,smile.fr];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.900];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E6862D6573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 02:10:27PM +0300, Mohamad Alsadhan wrote:
> On 26/03/12 02:50pm, Nicolas Schier wrote:
> > 
> > Why can't we just use this?
> > 
> >     echo 'exec $(HOSTRUSTC_LD) "$$@"' >> $@; \
> > 
> > 
> 
> I was being extra safe with quoting and escaping to make this as
> general as it can be. Just in case a more complex command with some 
> shell quoting is passed e.g.
>     `HOSTRUSTC_LD="env 'CCACHE_DIR=/tmp/my cache' ccache gcc"`

This does not work with the 'printf' variant (v4) either, as the space in
'my cache' will split the printf arguments and results in:

#!/bin/sh
exec sh -c 'exec "$0" "$@"' "env CCACHE_DIR=/tmp/my
cache ccache gcc" "$@"

Sorry, I frequently forget to handle spaces in subdir names correctly.
I'll send another suggestion as reply to v4.


-- 
Nicolas

