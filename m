Return-Path: <linux-kbuild+bounces-7778-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE4AED3F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 07:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB2311695FE
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 05:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5AB19F40B;
	Mon, 30 Jun 2025 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahExFm7n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E185227;
	Mon, 30 Jun 2025 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751262166; cv=none; b=XnSFNzPsVRBVwyVKBAyQuxnr+9r3fCUP2ejM/r+kLwqjvO3cDW9bU28bnL+GQS+2mf9cRG5+q0xFI6e+nRJlx+FCijVBec+VrahUH41dnn2GVyHp8KuJ77zeTYu6M6q4Maj6DhEJhwdrgn9EVdA9HLjc0h69KX3Re4Pm3BVIFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751262166; c=relaxed/simple;
	bh=G5j46WC0/RtKkaVfV/dsYY1f3Wv6zhVL/JBy2wncsxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ily/et9vDKZtQviW321LmP7VG/yN3IHN1Bza8lg1ex+LP3zk+v+9mJPR0A/9t0XDFg4kKXNPQxDxeN0lqFJGZ95y/YujNoVUVW6FO/4Ej6aikSvzSG9bFuRe0PMOBXtWZ40p4v5hycMlUkW9701KtES1QJ5Czw3njqodDvAwJFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahExFm7n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645CAC4CEE3;
	Mon, 30 Jun 2025 05:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751262166;
	bh=G5j46WC0/RtKkaVfV/dsYY1f3Wv6zhVL/JBy2wncsxE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ahExFm7n2WIbYrw5qo5EfffFj/6RXcZsuV2JIbkbF5YooXL9RnLpGCTwac764qjy0
	 pt5bmf4mpU4lenbmKAAY3zdeMBEwAUc2IQ/BbLB60Y39qbbcVzL4Sk/YezK7kS7GDu
	 c4/Ca1WLHZ2zvZwo73EHlkuGL4WLgIa4p+1EVAFfLvIVpKqhhdlT5aTEl55C4thRZi
	 hMx2YAxENbp0slR+7PJDAjr2yNwXHSbNGeKylluiCjwU891WPo92qkPqXFZNNB6VtY
	 Xf3a9em3I4NpWjCFYjtomDEYlJ5Rtty6kpsSS4yX35C08kZ3Sa3r0cxurHl/jgoWNo
	 dxZPtgKddr28g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so1788346e87.2;
        Sun, 29 Jun 2025 22:42:46 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw2wkfF7cbHIfa4b9sxCCpL+P1kCl6su3zvvlYUryjflk2oK2X7
	cy5iTLjjj5iak0wBEemLkQaepwdPDFTxUxTlclYddjdj34iFz1voSB17rPP6nttXkBha071U1Ja
	U0JtMbHMwUbwMxuU97/dGciqyClSD1l4=
X-Google-Smtp-Source: AGHT+IGQS0HjSHn2YEKlSmzpn0q9VEh3oS0/V2Q1fS7r1QWzLYIl4IZ1d23whruVVBf/ZxfXt/RJ9w3UNsWgDt4h07E=
X-Received: by 2002:a05:6512:110d:b0:553:5d00:be86 with SMTP id
 2adb3069b0e04-5550b9e9ca6mr4019556e87.41.1751262165023; Sun, 29 Jun 2025
 22:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org> <20250624150645.1107002-44-masahiroy@kernel.org>
In-Reply-To: <20250624150645.1107002-44-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 14:42:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATCvTYNgqYskC3eWG52M6_07rDLZXXJefJ5AtngWXxQ6g@mail.gmail.com>
X-Gm-Features: Ac12FXxJgpdLtBKvcHAoOcY3rKDoy2i1g2txMc4ZIwZDyh6Z5iRoFOvx7PV0d5c
Message-ID: <CAK7LNATCvTYNgqYskC3eWG52M6_07rDLZXXJefJ5AtngWXxQ6g@mail.gmail.com>
Subject: Re: [PATCH 43/66] kconfig: gconf: preserve menu selection when
 switching view mode
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:08=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> Preserve the current menu selection when switching to a different view
> mode, as it improves usability.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

There is a corner case where this does not work in Split view.
One example is a top-level symbol, such as CONFIG_64BIT.

For x86, CONFIG_64BIT is located at the top-level,
and it does not belong to any menu.

This works in Single and Full views.

[1] Choose Full view  (default)
[2] Select "64-bit kernel"
[3] Choose Single view and Full view back-and-forth
[4] "64-bit kernel" is still selected


However, this does not work in Split View:
[1] Choose Full view  (default)
[2] Select "64-bit kernel"
[3] Choose Split view
[4] "64-bit kernel" is not selected


The Split view never works in a consistent way.
I will consider whether I should fix such a corner case or not.





--=20
Best Regards
Masahiro Yamada

