Return-Path: <linux-kbuild+bounces-9173-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDDBDED26
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 15:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 538CA3B071B
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 13:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9CA23D7C5;
	Wed, 15 Oct 2025 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="M5bHJV8d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2D257AC6
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535919; cv=none; b=FK3sb98uZMSBE7lwtZwV68TyTOsa5RFjMVaL+577NtXtY4awSdjgLUm+ykx12+fE+RXVXRufGwwpy36aCI1jLkrYF+Id49nqH0l479AjGFGKVu84tNgyuPzBG3kcJVWcs0n/6t/NekgS51hUuKeUCn123W1zqWWcrAKo8G044MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535919; c=relaxed/simple;
	bh=gQj02BMbFg5G31HypWTEQU/2pt+L/bKycjy/zU6MHoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbYCkLIJooKi5Kx4azcT/zAI9mqt85sw2loPt643CLj+d5LI4SAIVbCREKcgQrdYE5HuHX92Er55KWEqRMucnoh+8Hk9Wx+qOdGDUJaPJpphN8Eu5ts+iT8vcUpMIL2gzHlhgWda/AuWDmIPKy1CUb29I9xusTbeLT31D2sU89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=M5bHJV8d; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1760535551; bh=gQj02BMbFg5G31HypWTEQU/2pt+L/bKycjy/zU6MHoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5bHJV8dlxNYo0I7y/CDOTFWgS2TLXKcSmYrSwkeixtebHhp5YkpiTB1UY8TAY0dA
	 PVJuKCrL4S4w/X4mvfSqpPA4MMiqUYeXQGUID6qZ2neNkSZ148hMENvl3ow216qa1I
	 asmc62hPyCrEq3eW39SRzn3m+MNbTQvBvijhb5Ps=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.53.4)
	(envelope-from <n.schier@avm.de>)
	id 68efa3ff-5261-7f0000032729-7f000001c46c-1
	for <multiple-recipients>; Wed, 15 Oct 2025 15:39:11 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 15 Oct 2025 15:39:11 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id F0351802C5;
	Wed, 15 Oct 2025 15:39:10 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id E1B41184433; Wed, 15 Oct 2025 15:39:10 +0200 (CEST)
Date: Wed, 15 Oct 2025 15:39:10 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Gang Yan <yangang@kylinos.cn>
Cc: Nathan Chancellor <nathan@kernel.org>, David Disseldorp <ddiss@suse.de>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gen_initramfs.sh: add the positive check for timestamp
Message-ID: <20251015-whimsical-uptight-tortoise-610aa3@l-nschier-aarch64>
References: <20251015021831.355966-1-yangang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251015021831.355966-1-yangang@kylinos.cn>
Organization: AVM GmbH
X-purgate-ID: 149429::1760535551-98EEAFD0-59B1E9D6/0/0
X-purgate-type: clean
X-purgate-size: 2125
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Wed, Oct 15, 2025 at 10:18:31AM +0800, Gang Yan wrote:
> The gen_initramfs.sh script has already checked that 'date' returned
> somthing, but it did not verify the content of the return. This patch
> adds a check to ensure the correctness of the timestamp obtained via the
> 'date -d'.
>=20
> Signed-off-by: Gang Yan <yangang@kylinos.cn>
> ---
> Notes:
>=20
> This issue is reported in mptcp-upstream-virtme-docker. A issue in RUST
> CoreUils [1] causes a compilation error:
> '''
> 	ERROR: Timestamp out of range for cpio format
> 	make[4]: *** [<KERNEL_SRC>/usr/Makefile:76:
> '''
>=20
> The root cause of this error is the the output of 'date -d0' is 'Sat Jan=
=20
> 1 00:00:00 UTC 0000'. We started a discussion on [2], and want your
> suggestion about 'Is the compilation error too strict when failing to=20
> retrieve the date? Maybe an extra check could be added to make sure the
> timestamp is positive?'
>=20
> Thanks,
> Gang
>=20
> [1]https://github.com/uutils/coreutils/issues/8898
> [2]https://patchwork.kernel.org/project/mptcp/patch/20251013101946.248420=
-1-yangang@kylinos.cn/
> ---
>  usr/gen_initramfs.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
> index 7eba2fddf0ef..a076719e4d9f 100755
> --- a/usr/gen_initramfs.sh
> +++ b/usr/gen_initramfs.sh
> @@ -223,7 +223,7 @@ while [ $# -gt 0 ]; do
>  			;;
>  		"-d")	# date for file mtimes
>  			timestamp=3D"$(date -d"$1" +%s || :)"
> -			if test -n "$timestamp"; then
> +			if test -n "$timestamp" && test "$timestamp" -ge 0; then

This will hide invalid timestamps w/o notice.  As KBUILD_BUILD_TIMESTAMP=20
is documented in Documentation/kbuild/reproducible-builds.rst, I think=20
it's a good thing to fail if it will not be considered while generating=20
the cpio archive.

Is there a good reason do support pre-epoch timestamps?

If you explicitly want to keep feeding KBUILD_BUILD_TIMESTAMP=3D"@0" (for=
=20
reproducibility), you might also want to set TZ=3DUTC (also for=20
reproducibility)?

Kind regards,
Nicolas

