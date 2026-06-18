Return-Path: <linux-kbuild+bounces-13815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gPyYFpGlM2qhEgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13815-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 10:00:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366569E4BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 10:00:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nYzSGJqs;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13815-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13815-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0721B301A070
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 07:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D603D7D8D;
	Thu, 18 Jun 2026 07:58:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42739361DBC;
	Thu, 18 Jun 2026 07:58:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769530; cv=none; b=umF9qadI/4UOH472IuFmGev6xB3YztRBDJ5D3aqwVnIA9gxxmvPAWxvvbg1VE14U2I9waHWTE92owSeGyPJWevYnicWweFxfn2uMe9A267++Og4Tg7Q1neb2yInIyimjH7hOGuqQV7Yr4e/7z7k/ixLml0T6U4rAh4OWGZ8rBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769530; c=relaxed/simple;
	bh=S69YZ36fCkdXH9m/lRRO0+E2+PwWzYTDjvt7nzgq8fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZGfiQJGq2CJjgMyAk8TD30+VC/ISR2+rMDityP2rgnmLk5qaG7iTySUg+v977FF5mmPlDqvHeH3mVYUkNieiMx/gggzvavhb4q0ol90UbkbSnsrrhgnp4QAvbDBvu/O3c1FbzE/mcTDVSgGOjuvAm4APLOpv1B/o5WhKvxD+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYzSGJqs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1E5761F000E9;
	Thu, 18 Jun 2026 07:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769528;
	bh=X9Re2AjJqpI+lz0lftbe6X0S5NaELGK5zHozVWXucgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYzSGJqsmsBs2ICNyrz2bquyXFnUGesv0uH33wwjm2njmNn8mQOpHFDXu/XB4kCSk
	 rVYROPUZFV0iBIUkyqaB0wgVl3Z+CSr0wpPPfn9/9kEBjHZfuOIA0nHXcHVjM6bmG9
	 YkX/UGYKIYKQTZte91T0PU8irLc4Yl/d6Ln6TvX+02VAnb2q4awgkYXGocqxioJLJS
	 /zwzHafe1aAL9eprQTCzEDhteaOB7wuAIN2j13gg05h8OL2LZ8srow3BG20g1jcUpG
	 tlAUvhFZQTG82Ke7fDt9AbnQaUpsXffWXLBZpwipIlYIijwtxAQDXS3t/n19AfZWsb
	 rbZV8bt4Su0tg==
Date: Thu, 18 Jun 2026 09:57:52 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kbuild: remove ISDN references in Makefile examples
Message-ID: <ajOlANn6mkCNiz-C@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
References: <20260613232830.147116-1-enelsonmoore@gmail.com>
 <178175273131.3916864.13607634190318049114.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178175273131.3916864.13607634190318049114.b4-review@b4>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13815-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:enelsonmoore@gmail.com,m:skhan@linuxfoundation.org,m:cp0613@linux.alibaba.com,m:rdunlap@infradead.org,m:corbet@lwn.net,m:linux-kbuild@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,linux.alibaba.com,infradead.org,lwn.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,levanger:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5366569E4BC

On Wed, Jun 17, 2026 at 08:18:51PM -0700, Nathan Chancellor wrote:
> On Sat, 13 Jun 2026 16:28:27 -0700, Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:
> > Documentation/kbuild/makefiles.rst uses some extracts from now-removed
> > ISDN code as examples. While they are harmless, they appeared in my
> > checks for CONFIG_* symbols referenced but not defined in the kernel.
> > Replace them with generic examples.
> 
> While I am fine with adjusting these examples to make it easier on tools
> such as yours, how does this solve your problem? CONFIG_FOO and
> CONFIG_BAR are still not defined anywhere. Are you adding exceptions for
> these symbols? I ask because I would like these to be a little more
> "kernel specific" if that makes sense.
> 
> Maybe it is not worth even checking Documentation/ for dead
> configurations at all since that is probably not going to be a bug very
> often but I guess it helps with cleaning up dead documentation?
> 
> >
> >
> > diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> > index 7521cae7d56f..ec8de1c20834 100644
> > --- a/Documentation/kbuild/makefiles.rst
> > +++ b/Documentation/kbuild/makefiles.rst
> > @@ -127,11 +127,8 @@ controllers are detected, and thus your disks are renumbered.
> >  
> >  Example::
> >  
> > -  #drivers/isdn/i4l/Makefile
> > -  # Makefile for the kernel ISDN subsystem and device drivers.
> > -  # Each configuration option enables a list of files.
> 
> I think I would keep these comment, it is still relevant (at least to
> me).
> 
> > -  obj-$(CONFIG_ISDN_I4L)         += isdn.o
> > -  obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o
> > +  obj-$(CONFIG_FOO) += foo.o
> > +  obj-$(CONFIG_BAR) += bar.o
> 
> For instance, I think using a more descriptive symbol illustrates the
> example a little better.
> 
>   obj-$(CONFIG_DRIVER_ONE) += driver_one.o
>   obj-$(CONFIG_DRIVER_TWO) += driver_two.o
> 
> Same thing for the other examples. I just don't find these variable
> names to be particularly good when illustrating actual real world
> examples as opposed to conceptual ones. Not sure if others feel the same
> way.

+1

I liked that the examples were taken from actual Linux kconfigs, so it
was possible to look them up and check the context as well.  So, yes, I
think updating these is a good idea!

Kind regards,
Nicolas

