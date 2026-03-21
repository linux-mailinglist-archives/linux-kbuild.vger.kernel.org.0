Return-Path: <linux-kbuild+bounces-12114-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB4hDBazvmkrXgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12114-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 16:02:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21A2E5EE7
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 16:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A5FF300A759
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 15:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2553261B98;
	Sat, 21 Mar 2026 15:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lrhAg88E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105A32F0C48
	for <linux-kbuild@vger.kernel.org>; Sat, 21 Mar 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105335; cv=pass; b=EKxt7jarWVhQ1RvrzMfnD8OmIciB368U03nMjH/7zT3M5ztR6jQ9Do+fa9VPLoAQntF5CWLQ/tapbXbiYe3Ohiq1ay4l5BQea5Bfj9VJgttIPGey0RJ195PxLQajuFpOy3uAjemxO9Hw+dDJ+hNkLT+FHR23QBRxwkz97vCFSrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105335; c=relaxed/simple;
	bh=aBOcaihD6QZtC2z/NbR5qxhdiq/126JOEF6gL0qWhkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4yL5X/M7fIJaMJVE4yjf8A4OVgmo6D0t7iMZFM9APu86cwOq3SNCIQn20WfusrFiPd2HPsnwzsMEeTMjWV2Uv/lXnD5W1h4oQcVDyTKM3L4pDP9QWIGqBB6Ni89BPHxEj8L1/c7tLredgLlcy7vaKJxw4Y6cfnGCwSV0ibpYME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lrhAg88E; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9831ed36d4so223484866b.3
        for <linux-kbuild@vger.kernel.org>; Sat, 21 Mar 2026 08:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774105332; cv=none;
        d=google.com; s=arc-20240605;
        b=de8nizwv4YdQADPGm+NcxrjBiuArkmA0mvirVQYKJnQIdgvduhoU2JKD/dFfhLTjcP
         +D/2Dr/vjodGQfWMrC12YelQ1c2oJB4bRotQT5zFedKZCOITI93BkCgH3DjoxTD8XnO+
         d2QH284eGh+LsxeIlZ+5qTIScv2/iE97p0EFJu212CCZdSuCTtbjBkweS85DLnf+njB0
         K0YpT/7OiT/8XMCpMwZVU9cveTq2a65z2U5cm61xtmLqNizQiciZUqQl3gqskk2pu2l+
         5kH6s17lr2jIBt5IF9SuPA+42Rn+i9Z49ob1FVBCq1deg6hwIqAxUoCAnkL9rakvyZZs
         4U/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B2lOT8vW/f3JJExeFrXd6EHyFOrqpnGvZscIGk6s1aE=;
        fh=2vJv6btdm4Ap6xgNLZZUiWoZpbO2tusq4Eu49es3y8E=;
        b=RnYseNTFOsUUHkdTnRdLOh0T2BT08oGrkhm6B00wPGva8/bo/xz5ufgdm85xw336K6
         fdiIy/0LUPGj1u2yRatx8eHaZniO9/SYCYYKOrqHBrqJ1YqhGEVlAm7AjBCWX2pM/3hX
         0IPEMlqeq32nBHZR3Khaco3tYVBGkRZT4PF3QwlMzE+sjCVmvizE9ppCnkw1WtXciTHc
         d1wEUXMEQTEr1/T/JQfYU2kZSHgt0w2RGknNZsBioDbyI7OrmXgGhA+uPZfuQdzu+Q+h
         GSScRFssqXNn//eRFXgUP+VPYNLscmSJA5vY+fZLsz0ncQsdtbUVsEhbTIXpMDWKB97K
         9NVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774105332; x=1774710132; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B2lOT8vW/f3JJExeFrXd6EHyFOrqpnGvZscIGk6s1aE=;
        b=lrhAg88EmOxl2c27zYTiQO+UMh454soOoCYj+oQmolgMG7H6ET0iMWcG8B8ptM52kP
         nwiTVD1mkI8HL2xc9kDe9GhNrkzzelpH7cghL8zPwsaQqq4ERAroKkFaUseRR2kbp4dl
         CqK+ZPqXHp9s9HyVdSHqtQTynYskAUublAc3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774105332; x=1774710132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2lOT8vW/f3JJExeFrXd6EHyFOrqpnGvZscIGk6s1aE=;
        b=iqVpXER+eRG5pmoKgQwmXy2/oWKqF/mktCTBz5ptDUZ37c0XUopmr+dq+D7RaGB5uy
         lmWAkPtVhreJxJx6cMQxXe+wGS+lczYyVBXWo/XV2wtVskXRHD+DXcSUsrUl7DTkf8GJ
         y0X654sfef6i4gPAtjGiogre/FNkgHyX8w5RgoVt73OvXSSggcgZmqvI/v4/jmYUcO3K
         PD1/+YfB5Tbsz20GTXKKdvXgDU1NHh+0Q1JACi0zUxH3sT+a7Drg43S317a4ECKqc9A/
         yn4Lr0NdYv2GqUMN8HiT7wkrKGUz/xT2bz48wxmzyPRaGjmQ3ceKiCiJpxeMe8hvCE88
         X1Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVH4BDBnVIUE6sUS/7EXFXVET5C/lewkShkZ03XDrfULr4LGRVX9nEp0Y1B8Qps/ik4scP/kKRg7jOVw78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwowopWFGxczYi1SgHysNldK8xceFsVGUHFdsGrLV6dSNuPFwrU
	UxD4xlBHJ1GYYEc6913WTa4y97c0mewXPPsWTKcDg/Y0pE87eStpUBrRJReT6teVh3Pinughl2g
	skVjWhymcz227F2Z/ngNQ2lBcr/cpb635tgulgNCv
X-Gm-Gg: ATEYQzxAqm1grthibLWnhJ9KmScxrWXVmdqLGwAGorb4eGzCQSD36yPVl9HumNHVbps
	N4fw1vcL5tSMYM6LdyGuguDJvw5sDZ6hAYCfQmblK6Mbg4gekdmGWZK8F8XML7NLXFjHa1zM3ns
	iAEEa8p9Hzo68iN0xxyJJ5+aHEZapFJncsMYrNwlLi1B7CB+1Ism113B/iaLd18JX89O4a7uaSf
	FSxWob7w2Ta9Ia551e94P18kCKuurG4cEKJOEXgXys8v76oFMQPqlxC7JhiFwrCQ7rTiUoUrKiN
	rCloAog=
X-Received: by 2002:a17:907:1604:b0:b93:8995:8f3a with SMTP id
 a640c23a62f3a-b982f0bdf0emr483042066b.3.1774105332361; Sat, 21 Mar 2026
 08:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net>
In-Reply-To: <20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 21 Mar 2026 09:02:00 -0600
X-Gm-Features: AaiRm53CKQ7Fryfe4zm5gfdQrIZJuBmFwVp2jHmqZE1I1Pwf0CV-AJCHSLi2eB0
Message-ID: <CAFLszTjpHZjMYx1NC8uAYETBF5bs3ddnt5oQHuHA9QHU9sEn6w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
To: Janne Grunau <j@jannau.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12114-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,209.85.218.43:received];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[systemd.io:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,jannau.net:email]
X-Rspamd-Queue-Id: 8A21A2E5EE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Janne,

On Fri, 20 Mar 2026 at 08:30, Janne Grunau <j@jannau.net> wrote:
>
> The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> target to build a cpio containing modules") is incompatible with
> initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> be a link and directory at the same time.
> Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
>
> Tested with Fedora distribution initramfs produced by dracut.
>
> Link: https://systemd.io/THE_CASE_FOR_THE_USR_MERGE/ [1]
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hej,
>
> this patch allows to produce modules-cpio initramfs which are compatible
> with initramfs with merged /lib and /usr/lib (/lib as symlink to
> /usr/lib). I expect initramfs of distributions with merged /usr to have
> a merged /usr as well. This is at least true for Fedora initramfs built
> with dracut.
>
> I'm not sure whether the trickery to avoid repeated '/' is justified. It
> is necessary to add a slash between "$@" and a non empty
> $(INSTALL_MOD_PATH) to avoid make failures due to non existing
> .tmp_modules_cpio when INSTALL_MOD_PATH without leading slash is used.
> modules-cpio-pkg`.
>
> Better or shorter ways to document this not completely obvious behavior
> would be appreciated.
>
> Janne
> ---
>  scripts/Makefile.package | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..ab18cf81622ae319380528c401f9aeb6d32070c6 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -195,7 +195,9 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
>  .tmp_modules_cpio: FORCE
>         $(Q)$(MAKE) -f $(srctree)/Makefile
>         $(Q)rm -rf $@
> -       $(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install

How about a comment for this line, e.g.:

# Prepend INSTALL_MOD_PATH inside the staging dir, stripping leading /

> +       $(Q)$(MAKE) -f $(srctree)/Makefile \
> +               INSTALL_MOD_PATH=$@$(if $(INSTALL_MOD_PATH),/$(INSTALL_MOD_PATH:/%=%)) \
> +               modules_install
>
>  quiet_cmd_cpio = CPIO    $@
>        cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
> @@ -263,7 +265,7 @@ help:
>         @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
>         @echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
>         @echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
> -       @echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
> +       @echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive (modules installed in INSTALL_MOD_PATH (default: /))'

Would this be clear enough? :

Build modules as cpio archive (respects INSTALL_MOD_PATH)

>         @echo '  perf-tar-src-pkg    - Build the perf source tarball with no compression'
>         @echo '  perf-targz-src-pkg  - Build the perf source tarball with gzip compression'
>         @echo '  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression'
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260320-kbuild-modules-cpio-pkg-usr-merge-4266a460282c

Reviewed-by: Simon Glass <sjg@chromium.org>

Regards,
Simon

