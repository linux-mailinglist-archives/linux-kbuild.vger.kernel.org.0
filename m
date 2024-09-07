Return-Path: <linux-kbuild+bounces-3456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8D96FF19
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 04:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2212FB23A22
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 02:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7657D33FD;
	Sat,  7 Sep 2024 02:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAxWe/8d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A7B657;
	Sat,  7 Sep 2024 02:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725674602; cv=none; b=X02xsJovuOOGpEE9IQxrkdYVlzdgaYgDpbxIdXjBzeEOydiDs/wHbJ5BohRWAr0roLCFrhzTPeqngtg6TMgSNcFuk5ubCLZCfMHVyTSmtM9VII/DUYf5TbkrvbrcRdaGwlRKJIWoCdCBTplt1J4mQ+nyVXw9c0Dp1hV9SuqnYu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725674602; c=relaxed/simple;
	bh=Hk2EGGq16biP+yZ6h5NqQ8pAy8Q8Ykm6aDAv3pg9IJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AES15n36gESY5PeC67RZaav1vc2w6PF3EjgB/ECKaD0izLuK5zyEjqpqwO4WadqUa/YRLR6zkGr8Lt/l1XJKL5at0m9HEr7hxM6w2aZ6X6qKxUyyrdnSNclDHIEfNtXTcKBWdW4D20atDu+0VoCkiqZ/dmfb4NgofCpxNGnH29o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAxWe/8d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEADC4CEC4;
	Sat,  7 Sep 2024 02:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725674601;
	bh=Hk2EGGq16biP+yZ6h5NqQ8pAy8Q8Ykm6aDAv3pg9IJk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nAxWe/8dHLm+bK07w0Epp9UactfmLja0tdwMKT50yr9E+qO7E9DTZbubkQaA7uE/B
	 FteRqRYMLpSTMFawo87QAwE2LF5rAftB5JwqFoFW5eAQ7G4qPvHU7Kp8dhWPmSLRd/
	 whldqxX+Tjp2V2g8BNB8uhPOqn3ZVprKNth66c3XCPELBPFVvz+vVJRfkBGPDJV+du
	 K3zvqflpTcCigSNNPM1RJnNLvmdt2zQw6RMOtjrbY+mpNBzs7Aa0aN3ZTQtJ473ziq
	 YUnYONylEx97VeS7TE3YGrmY2EfCRcFB8PXpM586Y4iw7c6V4WJ9TJT2FNXXdXKUAF
	 me4FbE4pCP8hQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5365c060f47so976466e87.2;
        Fri, 06 Sep 2024 19:03:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTP8MZduEzg0kxKqoQH6JOzNca7JiCglX4BLXUqGIG3VOfuhSeP4B9ny0pbCMuV+Fj50IISeEuYxpX04M=@vger.kernel.org, AJvYcCVlZss7ruWWMS9OO+73xPLD4WdMJysQ3/ahgaTQyeRzZKiGWdlwx6ro7GgjPO2TG01p8XuY68jazoWQzZ5j@vger.kernel.org
X-Gm-Message-State: AOJu0YxuIeAE3EkTTTP39+6/C9ORp9URzIS6iOmfLKj6tZ3c9b1iv34L
	Ib6GdHVx5tat+68Vwx2M4UjBRZxtmFb9X7fXCU1h0P0bTRESl1JOlpAuDFWcCDLHBcRMVhgOVkK
	mb+hmnFBTdXjXeHwZSKyOruw2M6Q=
X-Google-Smtp-Source: AGHT+IGuW9A/+Mtv/et+IIFraZ2DG+shMdS0pUGTfWcBsB/5fUVm3PT1A1YXsSaGWAIXYnScJY+vWY89qU1Dhl41VkI=
X-Received: by 2002:a05:6512:39cb:b0:536:545f:3893 with SMTP id
 2adb3069b0e04-5365880bd20mr2713458e87.57.1725674600516; Fri, 06 Sep 2024
 19:03:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3132727fea08e81e834104761b5a5630d337340a.1725636560.git.sam@gentoo.org>
In-Reply-To: <3132727fea08e81e834104761b5a5630d337340a.1725636560.git.sam@gentoo.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Sep 2024 11:02:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNATeuwaO8AvAqmz_4hyb5vjFnL-jhxbXv6_KoCTZbsS86A@mail.gmail.com>
Message-ID: <CAK7LNATeuwaO8AvAqmz_4hyb5vjFnL-jhxbXv6_KoCTZbsS86A@mail.gmail.com>
Subject: Re: [PATCH] fixdep: handle short reads in read_file
To: Sam James <sam@gentoo.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000901d2f06217dedc3"

--000000000000901d2f06217dedc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 12:29=E2=80=AFAM Sam James <sam@gentoo.org> wrote:
>
> 50% or so of kernel builds within our package manager fail for me with
> 'fixdep: read: success' because read(), for some reason - possibly ptrace=
,
> only read a short amount, not the full size.
>
> Unfortunately, this didn't trigger a -Wunused-result warning because
> we _are_ checking the return value, but with a bad comparison (it's compl=
etely
> fine for read() to not read the whole file in one gulp).
>
> Fixes: 01b5cbe7012fb1eeffc5c143865569835bcd405e


Fixes: 01b5cbe7012f ("fixdep: use malloc() and read() to load dep_file
to buffer")


I guess, another approach would be to use fread() instead of read().

Does the attached diff fix the issue too?





> Signed-off-by: Sam James <sam@gentoo.org>
> ---
>  scripts/basic/fixdep.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index 84b6efa849f4d..04d7742c99ac2 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -233,9 +233,15 @@ static void *read_file(const char *filename)
>                 perror("fixdep: malloc");
>                 exit(2);
>         }
> -       if (read(fd, buf, st.st_size) !=3D st.st_size) {
> -               perror("fixdep: read");
> -               exit(2);
> +       ssize_t bytes =3D 0;
> +       while (bytes < st.st_size) {
> +               ssize_t cur =3D read(fd, buf + bytes, st.st_size - bytes)=
;
> +               if (cur =3D=3D -1) {
> +                       perror("fixdep: read");
> +                       exit(2);
> +               } else {
> +                       bytes +=3D cur;
> +               }
>         }
>         buf[st.st_size] =3D '\0';
>         close(fd);
> --
> 2.46.0
>


--=20
Best Regards
Masahiro Yamada

--000000000000901d2f06217dedc3
Content-Type: text/x-patch; charset="US-ASCII"; name="use_fread.diff"
Content-Disposition: attachment; filename="use_fread.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m0ri19gq0>
X-Attachment-Id: f_m0ri19gq0

ZGlmZiAtLWdpdCBhL3NjcmlwdHMvYmFzaWMvZml4ZGVwLmMgYi9zY3JpcHRzL2Jhc2ljL2ZpeGRl
cC5jCmluZGV4IGNkZDVkYTdlMDA5Yi4uN2EwY2E5ZjBmYmJlIDEwMDY0NAotLS0gYS9zY3JpcHRz
L2Jhc2ljL2ZpeGRlcC5jCisrKyBiL3NjcmlwdHMvYmFzaWMvZml4ZGVwLmMKQEAgLTg5LDEwICs4
OSw3IEBACiAgKiAgYnV0IEkgZG9uJ3QgdGhpbmsgdGhlIGFkZGVkIGNvbXBsZXhpdHkgaXMgd29y
dGggaXQpCiAgKi8KIAotI2luY2x1ZGUgPHN5cy90eXBlcy5oPgogI2luY2x1ZGUgPHN5cy9zdGF0
Lmg+Ci0jaW5jbHVkZSA8dW5pc3RkLmg+Ci0jaW5jbHVkZSA8ZmNudGwuaD4KICNpbmNsdWRlIDxz
dHJpbmcuaD4KICNpbmNsdWRlIDxzdGRib29sLmg+CiAjaW5jbHVkZSA8c3RkbGliLmg+CkBAIC0y
MTMsMjcgKzIxMCwyOCBAQCBzdGF0aWMgdm9pZCBwYXJzZV9jb25maWdfZmlsZShjb25zdCBjaGFy
ICpwKQogc3RhdGljIHZvaWQgKnJlYWRfZmlsZShjb25zdCBjaGFyICpmaWxlbmFtZSkKIHsKIAlz
dHJ1Y3Qgc3RhdCBzdDsKLQlpbnQgZmQ7CisJRklMRSAqZmlsZTsKIAljaGFyICpidWY7CiAKLQlm
ZCA9IG9wZW4oZmlsZW5hbWUsIE9fUkRPTkxZKTsKLQlpZiAoZmQgPCAwKSB7CisJZmlsZSA9IGZv
cGVuKGZpbGVuYW1lLCAicmIiKTsKKwlpZiAoIWZpbGUpIHsKIAkJZnByaW50ZihzdGRlcnIsICJm
aXhkZXA6IGVycm9yIG9wZW5pbmcgZmlsZTogIik7CiAJCXBlcnJvcihmaWxlbmFtZSk7CiAJCWV4
aXQoMik7CiAJfQotCWlmIChmc3RhdChmZCwgJnN0KSA8IDApIHsKLQkJZnByaW50ZihzdGRlcnIs
ICJmaXhkZXA6IGVycm9yIGZzdGF0J2luZyBmaWxlOiAiKTsKKwlpZiAoc3RhdChmaWxlbmFtZSwg
JnN0KSA8IDApIHsKKwkJZnByaW50ZihzdGRlcnIsICJmaXhkZXA6IGVycm9yIHN0YXQnaW5nIGZp
bGU6ICIpOwogCQlwZXJyb3IoZmlsZW5hbWUpOwogCQlleGl0KDIpOwogCX0KKwogCWJ1ZiA9IHht
YWxsb2Moc3Quc3Rfc2l6ZSArIDEpOwotCWlmIChyZWFkKGZkLCBidWYsIHN0LnN0X3NpemUpICE9
IHN0LnN0X3NpemUpIHsKKwlpZiAoZnJlYWQoYnVmLCAxLCBzdC5zdF9zaXplLCBmaWxlKSAhPSBz
dC5zdF9zaXplKSB7CiAJCXBlcnJvcigiZml4ZGVwOiByZWFkIik7CiAJCWV4aXQoMik7CiAJfQog
CWJ1ZltzdC5zdF9zaXplXSA9ICdcMCc7Ci0JY2xvc2UoZmQpOworCWZjbG9zZShmaWxlKTsKIAog
CXJldHVybiBidWY7CiB9Cg==
--000000000000901d2f06217dedc3--

