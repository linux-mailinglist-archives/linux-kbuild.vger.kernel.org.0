Return-Path: <linux-kbuild+bounces-12965-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKoYHk/d82lk8AEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12965-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 00:53:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF54A8AC0
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 00:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16A74300BC51
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 22:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2768F26C39E;
	Thu, 30 Apr 2026 22:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASU5Y4t3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE4244694
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2026 22:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777589578; cv=none; b=ByEamvBtHgW8gAfjlea+0uG8/34mHawexJq5hY+8zHfF4ZoipOblk6tAK7NHAxqkRV+BterchPfAt+FU5xcvioEdehV7zCeRR6nufVxn7talACkM5HVAE9mVX76SfWnHqSOtwaNIpwE0uvGJr30FUP83F43qSk1JlaoaX3aiUi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777589578; c=relaxed/simple;
	bh=p0E7zX6rG7QZ4lmld45wU23wv5bL9haqQ626kmCyzUc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BiD7lgqaijgAZ8a7mUwo7Emu1oR2S7P/ffq4OsdY2LR1+zf5Jd9jdAmI/ihkZ3zj5m7WvBlkgxngtz+8naA82nfpLOkhH3EreX/1KvZeC7LR2J6o3aLOGJr+V08H/zFY7k+pY8cWRAOJSxoZA5bE+sxq42C+hwatyeMZiLdpLLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASU5Y4t3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD0BC2BCB8;
	Thu, 30 Apr 2026 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777589577;
	bh=p0E7zX6rG7QZ4lmld45wU23wv5bL9haqQ626kmCyzUc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=ASU5Y4t3jUPbqEVYC6iZg192Ul0rY5COERcpoDWvjk/nOnLdd8q4T0qxr/MVOhke1
	 FhPeuAL1Ha2sTE321k+jC44fhkRH7TYQgtqrBgWzD0DTlvhNv0iHQ1g/AL1EuN6R3Z
	 gnLtbfHHJsZG0TaTZttEj7QExIGvUY/tdDWwPcP2HxrypR0Ay2kq1hJSWTUZTy48la
	 mnYXRWTvh/lGfz07DI7bEOVkb48RLN41xih0n40UIG+DGHJjAcn0qFdr0O9fMrWkET
	 /N0/Pd25+suI6Czjplxx4WtMRoltQKLLmKLkmvFe9MgnNLGzczeaPAba6CW2fw3swZ
	 crJE6qVSdZg0g==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in
 builddeb
From: Nathan Chancellor <nathan@kernel.org>
To: Jill Ravaliya <jillravaliya@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, nathan@kernel.org, 
 nicolas@fjasle.eu
In-Reply-To: <20260430085442.35666-1-jillravaliya@gmail.com>
References: <CAHr0PbumU-Y4G9rmuffd3crfOpqgxvQii0cVEYFC_sdjjNEZRw@mail.gmail.com>
 <20260430085442.35666-1-jillravaliya@gmail.com>
Date: Thu, 30 Apr 2026 15:52:46 -0700
Message-Id: <177758956670.708.4239942158305667288.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088; i=nathan@kernel.org;
 h=from:subject:message-id; bh=p0E7zX6rG7QZ4lmld45wU23wv5bL9haqQ626kmCyzUc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmf73r4N1gxX7pu3/bw5Vw9bw7e9dzFF7KZ1Vt6Tx7c2
 fV569slHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiaRcYGZ5J3dD7LpX6wvF2
 5uKPM1ZvkV/j9uHDVJPP/XO2WL3UVfrKyLB4u+UZkzd8PQYaMndd5spf3SxxZQ1vIrevoe/ie6t
 kF7IDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 77FF54A8AC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12965-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Thu, 30 Apr 2026 14:24:42 +0530, Jill Ravaliya <jillravaliya@gmail.com> wrote:

Hi Jill,

Thanks for a quick v2!

> The 'builddeb' script generates maintainer scripts for Debian-based
> distributions. Currently, it invokes post-installation hooks via
> run-parts but unconditionally exits with code 0. This masks failures
> from downstream hooks (e.g., initramfs generation or DKMS).
> 
> On systems with modular storage drivers (CONFIG_BLK_DEV_NVME=m), an
> unnoticed failure in an early hook can prevent the initrd from being
> correctly updated, leading to a panic on reboot.
> 
> This patch ensures that failures in 'run-parts' are correctly
> propagated, allowing the package manager to abort the installation
> upon hook failure.
> 
> Signed-off-by: jillravaliya <jillravaliya@gmail.com>

Please use proper name formatting here.

>
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index ba1defc61652..feeb9d0d3b71 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -98,7 +98,12 @@ install_maint_scripts () {
>  			hookdirs="\$hookdirs \$dir/${script}.d"
>  		done
>  		hookdirs="\${hookdirs# }"
> -		test -n "\$hookdirs" && run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" \$hookdirs
> +		if [ -n "\$hookdirs" ]; then
> +                    if ! run-parts --arg="\${KERNELRELEASE}" --arg="/\${installed_image_path}" \$hookdirs; then

Is the escaping of '$' correct here? Prior to this change, these values
would be expanded when the scripts were written to disk but now they
will be expanded when the script is run, which seems incorrect since
those variables will not be set in this environment.

  | diff --git a/build/kbuild-7.1-rc1/debian/linux-image-7.1.0-rc1-00002-ge96b61aad8d5-dirty/DEBIAN/postinst b/build/kbuild/debian/linux-image-7.1.0-rc1-00002-ge96b61aad8d5/DEBIAN/postinst
  | index d9fc953e73c6..30ef722cfebf 100755
  | --- a/build/kbuild-7.1-rc1/debian/linux-image-7.1.0-rc1-00002-ge96b61aad8d5-dirty/DEBIAN/postinst
  | +++ b/build/kbuild/debian/linux-image-7.1.0-rc1-00002-ge96b61aad8d5/DEBIAN/postinst
  | @@ -16,5 +16,10 @@ test -d "$dir/postinst.d" || continue
  |  hookdirs="$hookdirs $dir/postinst.d"
  |  done
  |  hookdirs="${hookdirs# }"
  | -test -n "$hookdirs" && run-parts --arg="7.1.0-rc1-00002-ge96b61aad8d5-dirty" --arg="/boot/vmlinuz-7.1.0-rc1-00002-ge96b61aad8d5-dirty" $hookdirs
  | +if [ -n "$hookdirs" ]; then
  | +                    if ! run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" $hookdirs; then
  | +                         echo "E: Post-install hooks failed." >&2
  | +                         exit 1
  | +                    fi
  | +                fi
  |  exit 0

Was this a leftover from testing?

> +                         echo "E: Post-install hooks failed." >&2
> +                         exit 1
> +                    fi
> +                fi

Please fix up the indentation, as your change uses spaces but the rest
of this script uses tabs.

-- 
Cheers,
Nathan


