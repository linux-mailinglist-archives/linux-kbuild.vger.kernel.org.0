Return-Path: <linux-kbuild+bounces-4262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF19AC0C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 09:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C41C71C2339B
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 07:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65868155CB3;
	Wed, 23 Oct 2024 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uea3mEX+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F214D6ED;
	Wed, 23 Oct 2024 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670108; cv=none; b=pqjUyuurR2O/Dh+RAa32ReQiKoagJya1UZHq+1/rfpt5LyEhx3ZeRoHl+mFWkjrk0HPayLOh+67YKwbit0zcEpqhMmtSA24nEsiHR9F3MNREDWtZ71phpD+qxja2wKQbyQIVqA4GlNyeSLAoQTWLEjac6ySzAlr9Gu1chqKPMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670108; c=relaxed/simple;
	bh=2Kg9iUKuBhL9bX8ryhWk+KZ5/JzJOJougL+xzNkViVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icN/wHoldh4wY/rMC9JJiwdps6g/2vq9eE+w0R5XKU9hKWJau5EAruoSKPtKtk1C0biAe7nYt4qNZnzaYeuGKUpcLwS4MGdrPhyop/KORwpacAjdTFeOmMcUTzDxo+ELpGP6sUIkyM+C4KMk6rjIf4u/pPjFkHMwGKUWkPd5FJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uea3mEX+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D883CC4CEC6;
	Wed, 23 Oct 2024 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729670107;
	bh=2Kg9iUKuBhL9bX8ryhWk+KZ5/JzJOJougL+xzNkViVk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uea3mEX+DbH0OZNebA/c6e+h7DdXK+O7+Ol39/WAmPxRNIhqk0HuhhI4wCXCK92Qn
	 PGyZlwGHJ8wAnKHctzG7wK/hEYtNtLeY1UgHJIp7WUrgsRzkiKZDF7pHfVILZerAgk
	 oW8ni0fu8bjpz7npOsYH8hzyjyaBn5FpxrJ5Toiq6cqgCb6uJdUnGhZX4yvCfgsQXL
	 vk7mj0W547s7gh5YxK4XQaw8VvSUewOYZwoZ+Fo5tbLnyf6FbssRj4qcEXo2h1X1tP
	 GM1TdGNDCl3HBcrd9irOTK+I9qQeTOtOd4Ye2UFH4x0V/240ZJ3BfUNjKsyFSgttmt
	 i83uZnpGOvRQw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so7025529e87.0;
        Wed, 23 Oct 2024 00:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5Bg+z1ZnMgO+PQ2/IcsVzGQGXZMc+kesuN8Sy7kcGKwq+PPNJfPxWU7lHCcibFXyV27KHnX493X3yN10=@vger.kernel.org
X-Gm-Message-State: AOJu0YwESS/irCUHqK5dZt7Efi7MkYLC6NHkqpDQY9R599mc61sp7fAl
	E8CeoIY+0TyLK3ZzXRiLb7q/A/BonUUDkBpK+98JZP4M30voRnZExMvVrce6KgwUFIR5S79vy31
	y0KYBzD0w7A+4pZyUuwQfVqEi2o0=
X-Google-Smtp-Source: AGHT+IFfPmDY7Koc2/OcWiik9XcDY3ld8fp/MwVzRDQ2iHpEUi9gApsKoED/ytr+qTzB9oHCCFOqMfR5gs23iCSGbis=
X-Received: by 2002:a05:6512:3c98:b0:539:ee04:2321 with SMTP id
 2adb3069b0e04-53b1a34901amr659248e87.33.1729670106581; Wed, 23 Oct 2024
 00:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019211747.110140-2-thorsten.blum@linux.dev>
In-Reply-To: <20241019211747.110140-2-thorsten.blum@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 16:54:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYqJqOs7QAX8BL7RgAuMb61jL3rE5=L2AOeDjPC1HhXQ@mail.gmail.com>
Message-ID: <CAK7LNATYqJqOs7QAX8BL7RgAuMb61jL3rE5=L2AOeDjPC1HhXQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: nconf: Fix typo in function comment
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2024 at 6:18=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> s/handles/handled/
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/kconfig/nconf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 063b4f7ccbdb..c0b2dabf6c89 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -467,7 +467,7 @@ static void handle_f9(int *key, struct menu *current_=
item)
>         return;
>  }
>
> -/* return !=3D 0 to indicate the key was handles */
> +/* return !=3D 0 to indicate the key was handled */
>  static int process_special_keys(int *key, struct menu *menu)
>  {
>         int i;
> --
> 2.47.0
>


--=20
Best Regards
Masahiro Yamada

