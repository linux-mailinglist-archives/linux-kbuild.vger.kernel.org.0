Return-Path: <linux-kbuild+bounces-1887-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A108C9442
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 11:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0589A1C20A22
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 09:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718A11E4A4;
	Sun, 19 May 2024 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYOEMXai"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341236AA7;
	Sun, 19 May 2024 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716112267; cv=none; b=Y8d1ybY0LeYh+cMTl0UohvbyGQ7JOUWxFWlNPT9M6/krpfwq15iJsDehAyzKI2/MhWv+K/WMqV168mWzwva7sOIYChAjrfsoPl7CV1vePluMJqOugZXWlWuVyR4iya4d/SReK7+6cnbR0JvJ6SVrgnB/eInSnvhDnWSkmowZUyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716112267; c=relaxed/simple;
	bh=3JprvdO4cAbJlWHvij0ANYG8YTOgEtlE3SRHny01vHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qww84NTwDUkHIwmMjoFx/Ln80KuT8zCo94oWswc/Zgl8YW6DCsoQSYcpD33IlSPgWUW0hO+uNG0MvUsyyoHGzdDq5CE1NU5+ICwa+YAoUJS06djAB2c6asPBZ3eBLYat6h3txPUD6r8agr+CQy8QE36fhoE3GfYWg+EjIJkCjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYOEMXai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF99C32781;
	Sun, 19 May 2024 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716112266;
	bh=3JprvdO4cAbJlWHvij0ANYG8YTOgEtlE3SRHny01vHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYOEMXaiDaXa4Z+VLFHYVC0Xjy8k5/iFXajnYrOO1abWEOO9wJBLpg6bW4CzuXzUe
	 ZtufpgrWw9ZdmiY40OV8n5w4IQiv7xVYeGQnjKFg7szhkuP7KxsfGHqOvp+nIYzbgn
	 1joYT+SU8j6bv9b5UhLr4KnSiG1VQ2mWTk7tNqxfeXgvbDC8Atxdd5Uu2jqmBEINml
	 HxalfXiZuZH3V899gM1ri/33zo8rwrhK164QzMNzDCbZ87EGsHp2Nv1HWQ63tcMXWJ
	 /7Uskv4YBHqRlcgBEpqNgovZZ6ZpaOVi47nbHbxtZ0wDLMI5epVWHzBTHeNZuxh0De
	 zakUSmETtXjCQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51ffff16400so5457787e87.2;
        Sun, 19 May 2024 02:51:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YwmynHkG0KIq6OudVpXd130KiAO0oKJcwS8J0Le0K+cFi+xND4v
	1K9W/rEBQjLs4h8p7UTkPLSdJGkmoc//K4aOsProkloXThjNGT7MSwB7YyvNf18zuApMRU9ZMQN
	WsD7XfZqWzisXabUkbj/ZIH+jEKk=
X-Google-Smtp-Source: AGHT+IFuVhkyJR94JGDsvjQw/nwB8L7rhjJ6tWOKJw3iHf6JCeyl6BFUnvTcLvDsPV+a1HWFun64ky9W+FbILcBJAjA=
X-Received: by 2002:a05:6512:3d8c:b0:51e:f79e:15d9 with SMTP id
 2adb3069b0e04-5220fd7ce7dmr27793820e87.21.1716112265456; Sun, 19 May 2024
 02:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519092227.2101109-1-masahiroy@kernel.org>
In-Reply-To: <20240519092227.2101109-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 May 2024 18:50:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQV7vDLP3VzpSY41K6+DpFAi3Q021zsW5jqR0Ck3C+r_A@mail.gmail.com>
Message-ID: <CAK7LNAQV7vDLP3VzpSY41K6+DpFAi3Q021zsW5jqR0Ck3C+r_A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix comparison to constant symbols, 'm', 'n'
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 6:22=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Currently, comparisons to 'm' or 'n' result in incorrect output.
>
> [Test Code]
>
>     config MODULES
>             def_bool y
>             modules
>
>     config A
>             def_tristate m
>
>     config B
>             def_bool A > n
>
> CONFIG_B is actually unset, while the expectation is CONFIG_B=3Dy.
>
> The reason for the issue is because Kconfig compares the tristate values
> as strings.
>
> Currently, the .type fields of the constant symbols, 'y', 'm', and 'n'
> are unspecified, i.e., S_UNKNOWN.
>
> When expr_calc_value() evaluates 'A > n', it checks the types of 'A' and
> 'n' to determine how to compare them.
>
> The left-hand side, 'A', is a tristate symbol with a value of 'm', which
> corresponds to a numeric value of 1. (Internally, 'y', 'm', and 'n' are
> represented as 2, 1, and 0, respectively.)
>
> The right-hand side, 'n', has an unknown type, so it is treated as the
> string "n" during the comparison.
>
> expr_calc_value() compares two values numerically only when both can
> have numeric values. Otherwise, they are compared as strings.
>
>     symbol    numeric value    ASCII code
>     -------------------------------------
>       y           2             0x79
>       m           1             0x6d
>       n           0             0x6e
>
> 'm' is greater than 'n' if compared numerically (since 1 is greater
> than 0), but small than 'n' if compared as strings (since the ASCII


small than -> smaller than




--=20
Best Regards
Masahiro Yamada

