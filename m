Return-Path: <linux-kbuild+bounces-1986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12E8FA831
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2024 04:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A0928E4D9
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2024 02:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A1B12FB0B;
	Tue,  4 Jun 2024 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0s6wGdH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71A1E485;
	Tue,  4 Jun 2024 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717466955; cv=none; b=DXhiCs3tyQiiifTHqRt3sZG6Zgsmb5hCoH4i5AF8OfdfT8jRjKUcFycdBIs951oAIeBfoLVkaVMOnN1OEoS1w8QtBqxGkBv3/MtH1Q1LB1Teh+QxYgZEj1Jx7w1rF/D+HU5h9lQPtSVew0NvbhNNAsGX+XxPmAkpXQSL9LbDYy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717466955; c=relaxed/simple;
	bh=l4iBGvNBf69vv5P6FLxJp6TeJ+5tm1BdEhdf14FB064=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeUcf8CVtLcSVzGGMkVd+Eg51JKnnyPQe3QE8aRoqd0yB1OQlhrcTPtq6gV9LuBcP02D3csNyh5UBM3xtwDfMVm3H/soS47yljTjpu1VWQ+ji+TvacKB8ojf7VUhAiYz553AYDNxpMXdn7OsDMJe3fyFGzHpWUuoW57LXB1X458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0s6wGdH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E08FC2BD10;
	Tue,  4 Jun 2024 02:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717466955;
	bh=l4iBGvNBf69vv5P6FLxJp6TeJ+5tm1BdEhdf14FB064=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P0s6wGdHYmN8oqLJjh/LcmpZmQ7m7woCatCZXi9ojb3EBBOmtnGIlSpS27rkzedrO
	 scdICB03NhQ9fYMUREgkhZXmQhv73GZiTRTQn+dHx6q73AALidbm97izx1otPm2B5i
	 ln4M3KWgSM3VrvYQ5Xjh8NJbCdJ8YUxes1kEP6lKDVF2KBy0JKz6XDUwnpPncQ6tiA
	 wYh/6dEh3j51Mr/IiSHYR09gyvjOwgMTm92NAY3Y19/BsKnQRzt+xUuA0H3UWeJM2h
	 wk1WuPZ6IzeO6kSTNUXxOQxDHw7SZyFk35kE9L9V/g/CuJSuQaieLPA6Xue0iRq94e
	 rWxKXepkTXB5g==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so22938881fa.3;
        Mon, 03 Jun 2024 19:09:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YzOBChCC/x2M1uFQwJZXB7ANBgHSO4+yChTDofoKiVcgFxMVehU
	SkYS2BmGUvX2LUSaxVFz1uJbjlWsm+C0RaQF5hBO4KdPDIcKtkSUX3XeoMW4292xYhhyIfm9wDF
	xct7OsfKYO31o5j4Lm5ODJI5OSoA=
X-Google-Smtp-Source: AGHT+IHSKYy0d5Zn6MAm/KGMJybmrNW8ut9VWH+ZNpE7TILVgiDDZhFrzV/afImkfNTgt38DdQ+FVTH56snR+YJ6nEI=
X-Received: by 2002:a2e:9dd9:0:b0:2e3:4f79:4d26 with SMTP id
 38308e7fff4ca-2ea950af008mr70492251fa.11.1717466953879; Mon, 03 Jun 2024
 19:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603161904.1663388-1-masahiroy@kernel.org> <20240603161904.1663388-3-masahiroy@kernel.org>
In-Reply-To: <20240603161904.1663388-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 4 Jun 2024 11:08:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATNMcUR9j+tLRynJH5tFPcET0kzDeRuSBhC7uoTbEB_wQ@mail.gmail.com>
Message-ID: <CAK7LNATNMcUR9j+tLRynJH5tFPcET0kzDeRuSBhC7uoTbEB_wQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kconfig: remove wrong expr_trans_bool()
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 1:19=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> expr_trans_bool() performs an incorrect transformation.
>
> [Test Code]
>
>     config MODULES
>             def_bool y
>             modules
>
>     config A
>             def_bool y
>             select C if B !=3D n
>
>     config B
>             def_tristate m
>
>     config C
>             tristate
>
> [Result]
>
>     CONFIG_MODULES=3Dy
>     CONFIG_A=3Dy
>     CONFIG_B=3Dm
>     CONFIG_C=3Dm
>
> This result is incorrect because CONFIG_C=3Dy is expected.
>
> Documentation/kbuild/kconfig-language.rst clearly explains the function
> of the '!=3D' operator:
>
>   (3) If the values of both symbols are equal, it returns 'n',
>       otherwise 'y'.
>
> Therefore, the statement:
>
>     select C if A !=3D n

This is wrong.

I meant this:


      select C if B !=3D n






--=20
Best Regards
Masahiro Yamada

