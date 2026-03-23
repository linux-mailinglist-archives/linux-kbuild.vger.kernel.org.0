Return-Path: <linux-kbuild+bounces-12147-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGUHHRLzwGkSPAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12147-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 09:00:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E822EDFFA
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 09:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F5AA3053658
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 07:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC5C364029;
	Mon, 23 Mar 2026 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TGqMdeOM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F836308C;
	Mon, 23 Mar 2026 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252254; cv=none; b=PELFdb/rxlP0plGztGFEhDpmYJ4dIIRa5DZAugVp5qNyNpzS7jykBKZ7KRgPnOLV/6qOIwca2PvjhRTJ+dHn1T98PGIDKgzzkNNS592G3wQGWpJjKeMAwbA6drKrepDPI/hRDRwsmSYdzoiVTnEd4h4LQmKTnDA8XUdKpLfBWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252254; c=relaxed/simple;
	bh=VwtSJIp8ENHMSX+xFEF3sWtn+Y2VJrcUVbX8lQmkP+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnxojVFRIiFrKL03YQI0WEhdlUdlJTEBoXg+mzot9D5MQ/bnBiTZRi5Dj52k73sGRNisQDy0HFyIGxd0RhsmFW1PJpdzM6kasvB4TBCKTKWlGFNfQDBO4+t1ui6qewlyCGQeuFsJbBbswlhyYaDp9TEZDlDYEAiSISkCzhv5I0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TGqMdeOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D31AC2BCB0;
	Mon, 23 Mar 2026 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774252254;
	bh=VwtSJIp8ENHMSX+xFEF3sWtn+Y2VJrcUVbX8lQmkP+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGqMdeOMBMS40jbvN3VCndGyHRmX53aBTL8cPWIJ9jdvYJeiJ8heg2vZp7U4d7WVn
	 1u/yLe04dbEr8J1T3VCKnJxf2AY7v5xpvA7cb7yvIjE6DAvM1Z7nWI+Dgc0bBgMU50
	 qqH+S53n8p4Fd+UNSqcYmYHe4qs/l16LoK7Zr2R8=
Date: Mon, 23 Mar 2026 08:50:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
	masahiroy@kernel.org, linux@weissschuh.net, tamird@kernel.org,
	rostedt@goodmis.org, ihor.solodrai@linux.dev, ritesh.list@gmail.com,
	maddy@linux.ibm.com, peterz@infradead.org
Subject: Re: [PATCH v2] char: nvram: Remove unused nvram_mutex to fix
 -Wunused-variable warning
Message-ID: <2026032305-cross-sensuous-8f4a@gregkh>
References: <20260323073220.25798-1-venkat88@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323073220.25798-1-venkat88@linux.ibm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12147-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[arndb.de,vger.kernel.org,lists.ozlabs.org,kernel.org,weissschuh.net,goodmis.org,linux.dev,gmail.com,linux.ibm.com,infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: E1E822EDFFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:02:20PM +0530, Venkat Rao Bagalkote wrote:
> v2:
>   - Added missing Suggested-by tag from Ritesh Harjani (IBM)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

