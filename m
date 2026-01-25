Return-Path: <linux-kbuild+bounces-10862-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFdXHAw5dmmTNgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10862-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 16:38:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C481490
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 16:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F05230078F7
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 15:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73F631AA95;
	Sun, 25 Jan 2026 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1efEyIeI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED5A19D065;
	Sun, 25 Jan 2026 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355290; cv=none; b=RsnV358fT/HndAqsXjRov4cqrs6jKrR0Ci/WR+v2BtGHhJ5bcUGTReyCWDNTquDZFtFPt0I8kw9gqGLaPDXRIuAMALHIyVe2+S9/C05rn6ISHp4Cann5AP0/irsBAhnDLcQErnH1O0e3EYp6+wY0lIEIJE8kP7IhfTQyhwtHHWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355290; c=relaxed/simple;
	bh=0RrbqDs8Es4lsyhdmptDuKjOH/5nw5BfL5cJRlfr7HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfDD9AM4Z6249LR8Tz2mBjPDzpe6doo5IbT0zTNxiVz0yAFObyie0KN7iwEoKK6RyKadEguahKUsTO5XQI0s4FblQvq84/Hp0cGZ0IvcRUPB8unB3PJNDmb66CwY4VOWNM4WzXAeoV8pDh0FiqL56yiDvPSS7scDuhAaRhUsQBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1efEyIeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB5AC4CEF1;
	Sun, 25 Jan 2026 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769355290;
	bh=0RrbqDs8Es4lsyhdmptDuKjOH/5nw5BfL5cJRlfr7HU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1efEyIeIUg8E7R4X7RVVKAutjQPQQ+wI3NSztzD7QZc5xPsmguRHlN4jzRv0z5Qat
	 yx5Ui//KDzU9pHX37j36vs6ple/F9i9lP0xM42YZ3zkXusANLqreS0b8OHxj0FmEVg
	 yEOvxoCwEOct4zZ0Bv9n+nGU/wJdtCkDCcVMgsKs=
Date: Sun, 25 Jan 2026 16:34:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Luis Augenstein <luis.augenstein@tngtech.com>, nathan@kernel.org,
	nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
Message-ID: <2026012533-preflight-surviving-43e5@gregkh>
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh>
 <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10862-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C70C481490
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 04:20:40PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 22, 2026 at 7:35 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Lots of different attempts, usually using bpf and other run-time tracing
> > tools.  But it was determined that we already have this info in our
> > build dependancy files, so parsing them was picked.
> >
> > If you know of a better way, that would be great!
> 
> Yes, if I understand correctly, then this should be done on the build
> system side (i.e. I don't see how BPF/tracing could achieve this, so
> maybe I am missing something), but what I meant is that there are
> several ways to do this in the build system side.

for a horrible hack of an example of how you can do this using
bpf/tracing, see this "fun" thing that I use every so often:
	https://github.com/gregkh/gregkh-linux/blob/master/scripts/trace_kernel_build.sh
it uses bpftrace to inject a script and then do a build and then
post-process the output.  Not something you should ever do on a "real"
build system :)

> One is this kind of post-processing after the build, which is easier
> in that it avoids touching Kbuild and can be written in something like
> Python, which always helps. The downside (my worry) is that it
> introduces yet another layer to Kbuild.

That's what is happening here, it's post-processing the build files to
detetct the dependancy graph it already knows about.

> My first instinct would have been to try to see if the build system
> itself could already give us what is built while it gets built (i.e.
> just like it outputs the `cmd` files). So I wondered if that was
> considered.

cmake can do this, that's what Zephyr uses, but we don't use cmake for
kernel builds.  I know the gnu toolchain developers have talked about
adding this to make/gcc/whatever in the past, and I thought Red Hat was
funding them to do that, but it seems to have never gone anywhere and
it's been years since I last heard from them.

> > Changing kbuild would be great too, if you know of a way we can get that
> > info out of it.
> 
> It depends on what is needed, but Kbuild of course knows about input
> and output files and dependencies, so I was thinking of outputting
> that information in an easier format instead of having to parse
> command lines from the `cmd` files.

"all" we need is the list of files that are used to make the resulting
kernel image and modules.  Given that the kernel build is
self-contained, and does not pull in anything from outside of its tree
(well, with the exception of some rust things I think), we should be ok.

And kbuild already encodes this information in the cmd files, for the
most part (there are corner cases and exceptions which the developers
here have gone through great lengths to track down and document in the
scripts.)  So 99% of the info is there already, which is why the cmd
files are used for parsing, no need to re-create that info in
yet-another-format, right?

> > It should be part of the kernel build process, and generated as part of
> > it as it will want to go into some packages directly.  Having to run the
> > build "again" is probably not a good idea (i.e. do you want to modify
> > all the distro rpm scripts?)
> 
> Even with `CONFIG_SBOM`, they will need to modify at least their
> kernel configuration, and perhaps more if they want to save the SBOM
> files differently, e.g. in another package etc. So I am not sure if it
> is a big difference for any distro than adding a word to their `make`
> line.

Let's stick with a config option for now please.  If the distros who
will need/want this decide to do it in a different way, they can send
patches :)

For now, this should be sufficient.

> Now, I understand it may be easier to tell users to "just turn one
> more config", and perhaps it looks more "integrated" to them, but I
> mainly asked because, to me, the SBOM is orthogonal to the kernel
> configuration.

It's a build-time output, just like debugging symbols are, and
documentation.  Ok, documentation is a separate build target, and "to
the side" of the source build, but you get the idea :)

> In other words, I would have expected to be able to get an SBOM for
> any build, without having to modify the kernel configuration at all.
> After all, the kernel image should not change at all whether there is
> an SBOM or not. We also do not do that for some other big "globally
> orthogonal" things that involve generating extra files, like
> documentation.

The SBOM is directly tied to the kernel configuration in that it needs
to know the config in order to determine exactly what files were used to
generate the resulting binaries.  That's what the SBOM is documenting,
not "all of the files in the tarball", but just "these are the files
that are required to build the binaries".  Which is a tiny subset of the
overall files in the tree, and is really, all that the target system
cares about.

thanks,

greg k-h

