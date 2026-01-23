Return-Path: <linux-kbuild+bounces-10852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DqVKmUIdGmE1gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10852-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 00:46:45 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDCD7B88A
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 00:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96C77300559E
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 23:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54D31A3157;
	Fri, 23 Jan 2026 23:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AihXnSrJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934CF18BC3B
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 23:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212003; cv=none; b=TUAId7nDtZX5GFG0yq0Z/A6lgWXlqxeTxOZLaiSBAAqUtpx4W6rzFMCsK4nIIiVtUOKrbWi7jQ7CuNsFPGr1ZOwktorTj6INXuJeogfNx8wpr9UUSEcbFlenURAOMAKK76LOY5l35s+FXfI5Rq0LZfM2BUjj8tBrozi6TnXn5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212003; c=relaxed/simple;
	bh=BISVtK7CSzdmHz/WB1m1939JfNhSPGxcABfnaeEOaLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzE+JvnlVgpmsL1RxLtexff+ocxcgav1rjtLSYrgIUWns7k+l4EPQs+3bzHTY7VPka6tfrx4shy7XfMjUa40ac2TORG3FfhU3lzBt1COPWxczCrO7dabVQhWgccQbTeKoarHmvbX9ZSfrc1ZPciAlpJj/zZbkh+0donxHjHiqmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AihXnSrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B752C4CEF1;
	Fri, 23 Jan 2026 23:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769212003;
	bh=BISVtK7CSzdmHz/WB1m1939JfNhSPGxcABfnaeEOaLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AihXnSrJj051TNoX0uxeNTfJnxVYgYRy77Jr3KIsK7BnH5U4hkJ6LFmGcQkG0kgmx
	 gwEW3w2YQ6q/mC285BIz2le4Rif5Ox2IDmIxFTF8vsAcSasHVK0Pp/egVMITY0cToJ
	 /65zW6mlEv9Zlq/lxln+uO1jZY6hwG9I1fLBK1rDKxRrTn3/8hS+tZzcIommDxrFs8
	 3IohIc2oGV+rybKAhfS7IpOrwzDYuz81iBRPBz4gXn/LuiSd2wG/6pxQV2Z83SeCu7
	 ACcqeQbLc03+uzc6ty9KjsUaaMNluD+WuCUaoXYYxllmv9FnnTEUVcjWXRbux+4Jet
	 TtPCbSA7vM1NQ==
Date: Fri, 23 Jan 2026 16:46:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/3] scripts/container: Minor fixups suggested by ruff
Message-ID: <20260123234639.GB206716@ax162>
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
 <02fe1347-0124-45be-9b8a-7a439ce48a38@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02fe1347-0124-45be-9b8a-7a439ce48a38@gtucker.io>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10852-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3FDCD7B88A
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:26:20PM +0100, Guillaume Tucker wrote:
> Hi Nathan,
> 
> On 23/01/2026 12:27 am, Nathan Chancellor wrote:
> > Hi all,
> > 
> > This series fixes a few warnings that I see when running
> > 
> >    $ ruff check --select C4,RUF scripts/container
> > 
> > which were the few warnings from my personal ruff.toml that seemed most
> > interesting.
> > 
> > I will apply these on top of the initial scripts/container change.
> > 
> > ---
> > Nathan Chancellor (3):
> >        scripts/container: Turn runtimes class variable into a tuple
> >        scripts/container: Use list comprehension in get_names()
> >        scripts/container: Use iterable unpacking for _get_opts()
> > 
> >   scripts/container | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 6eac13c876805f61bbb588eaff5ada0b6dc603e8
> > change-id: 20260122-scripts-container-ruff-fixes-4d38fc92771a
> 
> LGTM - some of these things are arguably more a matter of individual
> taste than absolute best practices but it's good to have a
> well-defined code quality standard.  I typically use Pylint,
> Pycodestyle and Mypy, not Ruff or Black.  So for the whole series:
> 
> Reviewed-by: Guillaume Tucker <gtucker@gtucker.io>

Thanks a lot for taking a look and providing the comments. I am going to
hold off on this series for a little bit to ponder on providing a
.ruff.toml file first to ensure we have a common understanding around
Python linting in the kernel, especially given a lot of these lints can
be opinionated as you mentioned.

Cheers,
Nathan

