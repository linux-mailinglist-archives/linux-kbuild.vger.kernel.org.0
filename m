Return-Path: <linux-kbuild+bounces-10792-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBqOOBXIcWknMAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10792-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 07:47:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 534C36256F
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 07:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F5024F8D67
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 06:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DAD47F2C1;
	Thu, 22 Jan 2026 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O4tUdnFA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76047AF60;
	Thu, 22 Jan 2026 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769063746; cv=none; b=uCZ4Pp5FsrJBGJMJ2h3o7/9MqWzPBLPjx710x25hM4WjAi+iDKSog1e/sgfIY4mx+WGguHb8kBhCzINL5OMjCWxoj32eYqb2sCqtUdYh1WHx9ehY4sofr0ZEXspwU8YADnTck8h7qVWIJ5RDfKFjf/OIW10KgNgkOUGS5JpJGI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769063746; c=relaxed/simple;
	bh=xbZV7r8uApzB1QtIO0wVqTBTa0EGZM2dlP4CZ+E8lew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYHwLIbBOKXv/k+EdPOqAyBfBPl8iiyuXm+vFmcBmTgBnD31UkFj+5bBsoZ/YiDNEsQSeS/ouyY60Bf+mPVbyftmA/zwbMOvYFwMF/+ozcRP14gKSUxA9JsTeORMd2f2ZjASg9Oe7OltADgICrHeIPgNMKWQ6phHi3ew1dl3LD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O4tUdnFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C5DC116C6;
	Thu, 22 Jan 2026 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769063745;
	bh=xbZV7r8uApzB1QtIO0wVqTBTa0EGZM2dlP4CZ+E8lew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O4tUdnFA2Iv+C/l4IxYXQbIsTZLG/dzfAnOHY5WsDX0uQHhq5NvYozAM1KR73ljS1
	 AgR0L/YQQUnPrXjMGzlhtQtNU2qcbEkdyzhTa3tqVN7BFCJJkApUyMmwvS54zhHUlx
	 DQKO8nsz96WV/wGAJoomnQIoDtkm0xhRatMfHSHc=
Date: Thu, 22 Jan 2026 07:35:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Luis Augenstein <luis.augenstein@tngtech.com>, nathan@kernel.org,
	nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
Message-ID: <2026012214-magician-mashed-c84c@gregkh>
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.04 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10792-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linuxfoundation.org,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 534C36256F
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 07:18:18AM +0100, Miguel Ojeda wrote:
> On Wed, Jan 21, 2026 at 6:55 AM Luis Augenstein
> <luis.augenstein@tngtech.com> wrote:
> >
> > The sbom tool is optional and runs only when CONFIG_SBOM is enabled. It
> > is invoked after the build, once all output artifacts have been
> > generated. Starting from the kernel image and modules as root nodes,
> > the tool reconstructs the dependency graph up to the original source
> > files. Build dependencies are primarily derived from the .cmd files
> > generated by Kbuild, which record the full command used to build
> > each output file.
> >
> > Currently, the tool only supports x86 and arm64 architectures.
> 
> I am out of the loop, and I don't know the requirements here, but what
> kind of approaches were considered for this?

Lots of different attempts, usually using bpf and other run-time tracing
tools.  But it was determined that we already have this info in our
build dependancy files, so parsing them was picked.

> Parsing the `.cmd`s seems a bit ad-hoc / after-the-fact approach, and
> from a very cursory look at the patches, it seems to require a fair
> amount of hardcoding, e.g. it seems we may need to list every
> generator tool in `SINGLE_COMMAND_PARSERS`?

If you know of a better way, that would be great!

> Now, if this is meant to be best-effort and cover the most important
> parts, it may be fine -- again, I don't know the requirements here.
> But if it is meant to accurately match everything, then it will
> require keeping those lists in sync with Kbuild, right?

It should match everything, and yes, it will require keeping things in
sync.

> Hmm... I feel like changing the build system itself (whether at the
> Kbuild level or even a customized Make itself if needed) to record
> this information would be conceptually simpler / more elegant, even if
> changing Kbuild itself can sometimes be quite a challenge.

Changing kbuild would be great too, if you know of a way we can get that
info out of it.

> In addition, why does this need to be a `CONFIG_` option? Should this
> be a separate tool or at most a target that supports whatever config
> happens to be, rather than part of the config itself?

It should be part of the kernel build process, and generated as part of
it as it will want to go into some packages directly.  Having to run the
build "again" is probably not a good idea (i.e. do you want to modify
all the distro rpm scripts?)

thanks,

greg k-h

