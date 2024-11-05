Return-Path: <linux-kbuild+bounces-4522-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FCC9BD9DD
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 750721C21858
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37F41D4333;
	Tue,  5 Nov 2024 23:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+jjt5gQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBD9149C53;
	Tue,  5 Nov 2024 23:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730850381; cv=none; b=mKEJE74s3QHe3aAJMVKXd0eOxvR67tKx9S6W0obx1ZgZOEf6cIxEv+Wz7bvlxI5zaZlcE73HRPAJINzP6eRrbgSnQRoZ8GusAycLGAryju8Hqp3JBGMtoWn25vkih8GZIJ0lNpeuIQw8AVRm7lkon0lsSQkN5mps/qwZosBLDKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730850381; c=relaxed/simple;
	bh=QEcMKih8y1DGDj0wUlohLxE9TFKUXnq1wsTk7LdmzcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vsq7HX8PxHo8PLPnKtIxUqntns6s+lE/XxdK3G/6dYn3j3IjDKBp7gNoqxy9wIBYACwoteLfmEwIkVMhF8zfHPHgQ2eszwkNgxKwlPWEHb78Zdk8ARUC5JxjiWgUZb+nBmxI93SofE/o2NJP/ZZcAFFqpCUJPPCjAGjggA1B270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+jjt5gQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCF8C4CED0;
	Tue,  5 Nov 2024 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730850381;
	bh=QEcMKih8y1DGDj0wUlohLxE9TFKUXnq1wsTk7LdmzcI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T+jjt5gQoAnJ7vMyWAKPzkzFxlWfe4GuIFGThlCmZBQGpxpxf9kSxksSFe8iGV65w
	 ba0G4wfwaM9BrDb7/REesvD+ZpcfbNCeMJMJgAQTA2k8QNx+WfM9dR+eHHD3D/6mIi
	 2DePB6devu1oU3UKrmIAIo9/69QQI/sRF+mv9E3olucGt/RHyehw9IV4hx69P12Gj8
	 4IAvKbaSNCfxLu7SzG2mxcAI7l7FHijVsq7RGCo/ze38qspU2gcMh0r1lX4p/oYtPm
	 XB8YKueXEabjl+4J/d29MhqrqBFpCy1kl3YtyokTkY8FTezR20X/3if/YZRDTc9k9r
	 Z7eCU4csA2psQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so3177901fa.0;
        Tue, 05 Nov 2024 15:46:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQhWhw3hRf58lkcX5jHNGHqSARejYed5VfI6T7/xgZp4x5l6dmy5ErHpBqF1hHbgWiHGRaRoyZtBw7g04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1izVzUSTdF02j2wIemyIMTBgZ7t0OvZ7Cda6kJ3XP+TPEowj
	THZ77KwEQpsvzL4wNJK9+f6+etw5sRzSKIRt8AF+y+l6O53tYOfF7c1rJ42UbuKzlxCTWiCO+S+
	lQ5Qw2YAJ7ySI83bgCi2CplsBKd4=
X-Google-Smtp-Source: AGHT+IF6vhckm1sWNoM+t51Vxb++S0i+toSwboUpiFopgY8v4SiFlFqiM+HDQbydNxObdyUdxe3tsEIDhxBgzivZ+mA=
X-Received: by 2002:a05:651c:1613:b0:2fe:e45a:4f6c with SMTP id
 38308e7fff4ca-2ff0cb513b1mr1747221fa.6.1730850379767; Tue, 05 Nov 2024
 15:46:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com> <20241014141345.5680-8-david.hunter.linux@gmail.com>
In-Reply-To: <20241014141345.5680-8-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:45:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNASqqbNX652UdyO_MeLmcxsno-zHykeO1ff0rES=_PAOqw@mail.gmail.com>
Message-ID: <CAK7LNASqqbNX652UdyO_MeLmcxsno-zHykeO1ff0rES=_PAOqw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] streamline_config.pl: check prompt for bool options
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:14=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Select configs that do not have a prompt. Config options can be bool or
> tristate. Ensure that bool options are also selected.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
> V1 https://lore.kernel.org/all/20240913171205.22126-2-david.hunter.linux@=
gmail.com/
>
> V2
>         - changed patch subject
>         - changed the order of this patch in the series patch
> ---

As I reviewed in v1, this patch depends on 6/7.




--=20
Best Regards
Masahiro Yamada

