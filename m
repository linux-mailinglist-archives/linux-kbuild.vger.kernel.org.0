Return-Path: <linux-kbuild+bounces-12860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFIaM29G6WnPXAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12860-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2026 00:06:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE744B355
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2026 00:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC60130515C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 22:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081EC340280;
	Wed, 22 Apr 2026 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0TrCNDW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954A223DE7
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Apr 2026 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776895596; cv=none; b=lfSDVPgT1n3zTps/8eaHVCELGZ8DYF1BbtomWscmgSnJ8ls7rUl4T/BBcLeRqLCaFPa/gbMnBXAA4O+bGHFWkytf76CRFE0TWbaNYNhj0mykTkLqV/CZYQ+CnQCqOn4naujJbfUsoV1AJnfgTHpR8LiXmJFR94QbFS96m8qF91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776895596; c=relaxed/simple;
	bh=xPOcMHq4quBDWyDX0UxGK1nk6pKFJNixxz/ejLvk1pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kc8wH4SNglnwL9+DbgMkLxPeA/Sr7WKRPKYsm3aw/hzaBUQAbZhcF8pLyHXiLoU5XsoWdbgLJdVK1zgqKMUOAmleTn+NK3hmBONhPtAGa1RRaO5EV7kg9XWgU6o5OwI2vaE9yXtk0dQnqbvSMeUHMyljrTdCLawiMqvmttoTonM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0TrCNDW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E7FC19425;
	Wed, 22 Apr 2026 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776895596;
	bh=xPOcMHq4quBDWyDX0UxGK1nk6pKFJNixxz/ejLvk1pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0TrCNDWtd3GjUZFOUTzLe6GAzYnpcn3Xwe/6a0hxbXBPqCIQcsdOK557LSyXoR1s
	 xmxpdzgnbn+IiYwuVGju0DhIMTyErC8nQyp7X5VCb6G8yXqEW4ggXDN1lIwwJJiiy+
	 cjxewtC2V7VEsktSmxbHnjtl3i0PDSPkV9yK8LwWzFNsISXVocJl4fmyONU6aQTNqv
	 6d4sQHME+fWMwNhAB5ikSYLYTCufRxAOTV7BhAYR6evfjnAbQnTcTIjZNZD2t/gjep
	 GEoq65MPK04cybshO7j10GQUIfuf6EWFNboJYmRdjMwGrXCtt14/RLKIC5xPYqTWZT
	 eCEHtMqPkXvCQ==
Date: Wed, 22 Apr 2026 15:06:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jill Ravaliya <jillravaliya@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in
 builddeb
Message-ID: <20260422220632.GA1448493@ax162>
References: <CAHr0PbumU-Y4G9rmuffd3crfOpqgxvQii0cVEYFC_sdjjNEZRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHr0PbumU-Y4G9rmuffd3crfOpqgxvQii0cVEYFC_sdjjNEZRw@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12860-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 33CE744B355
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jill,

Thanks for the patch!

On Thu, Apr 23, 2026 at 12:00:12AM +0530, Jill Ravaliya wrote:
> >From 1d7c7d8bf70c3d2b2abbb5ead3c654978ead419a Mon Sep 17 00:00:00 2001
> From: jillravaliya <jillravaliya@gmail.com>
> Date: Wed, 22 Apr 2026 23:37:39 +0530
> Subject: [PATCH] kbuild: deb-pkg: propagate hook script failures in builddeb
> 
> The 'builddeb' script generates maintainer scripts for Debian-based
> distributions. Currently, it invokes post-installation hooks via
> run-parts but unconditionally exits with code 0. This masks failures
> from downstream hooks (e.g., initramfs generation or DKMS).
> 
> On systems with modular storage drivers (CONFIG_BLK_DEV_NVME=m), an
> unnoticed failure in an early hook can prevent the initrd from being
> correctly updated. This results in a successful package installation
> exit code despite a broken boot configuration, leading to a
> 'VFS: unknown-block(0,0)' panic on reboot.
> 
> This patch ensures that failures in 'run-parts' are correctly
> propagated, allowing the package manager to abort the installation
> upon hook failure.
> 
> Signed-off-by: jillravaliya <jillravaliya@gmail.com>
> Link: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/2141741
> ---
>  scripts/package/builddeb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 3627ca227..6ea768f08 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -98,7 +98,12 @@ install_maint_scripts () {
>   hookdirs="\$hookdirs \$dir/${script}.d"
>   done
>   hookdirs="\${hookdirs# }"
> - test -n "\$hookdirs" && run-parts --arg="${KERNELRELEASE}"
> --arg="/${installed_image_path}" \$hookdirs
> + if [ -n "\$hookdirs" ]; then
> +                    if ! run-parts --arg="\${KERNELRELEASE}"
> --arg="/\${installed_image_path}" \$hookdirs; then
> +                         echo "E: Post-install hooks failed." >&2
> +                         exit 1
> +                    fi
> +                fi

Unfortunately, this patch is malformed so it cannot be applied. Please
see

  https://docs.kernel.org/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
  https://git-send-email.io/
  https://docs.kernel.org/process/email-clients.html

for information on using git send-email (the traditional way) or

  https://b4.docs.kernel.org/en/latest/contributor/overview.html
  https://github.com/ClangBuiltLinux/linux/issues/2093#issuecomment-2932754317

for information on using b4 (the new way).

Otherwise, the premise of this patch seems reasonable and I would be
happy to test it properly once it can be properly applied to the tree.

>   exit 0
>   EOF
>   chmod 755 "${pdir}/DEBIAN/${script}"
> -- 
> 2.51.1
> 

