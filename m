Return-Path: <linux-kbuild+bounces-3032-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 493EF953D5E
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 00:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED880284DA4
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 22:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28778249F;
	Thu, 15 Aug 2024 22:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WG13Q+hn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D30315E88
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 22:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723761680; cv=none; b=I0ykSs7XY3Jr86eZ+TZvCirvvvbMTGBY9lC1sINBqHESRcsihLg4VBr+Aqpjt+Qrw+uM+hzPZUCBefW8jJHHvB2DYrcqri4zvbdpf/2DT9RufLgtJZlu2PRQYbxrxi7IFbGa3eEmvmtU8xQ91nljKuJbsyC4BlwdNahZxkZUoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723761680; c=relaxed/simple;
	bh=8/lmrWUCFEp2gDWtKtvIwSYxP3VG2mfTv86iVUC33Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJiVcXBvDla6JJPPCiJ/MJx+uwdqsS9/YHmDXPmTir2GXw22Rymtd37zPlPGVVp96AEoxdyuJt9HEgDoZf5p/BZpE2AC3K9Y6FYpzo9O/jKjaxvKBaElC4lNbwrjGmQAvPrHlDWaaV3rMKAlP2KEt0AMCkb5iShhHj7x4T23ZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WG13Q+hn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2534AC4AF0C
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 22:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723761680;
	bh=8/lmrWUCFEp2gDWtKtvIwSYxP3VG2mfTv86iVUC33Ds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WG13Q+hn8GXXQaZVi9qjsCxo/+pZJlh/lItqUUB4izInDo89CAGhvBqHGr8dAcUXK
	 swN9ucSX8HYyTFyG1IrAmmPy+Y5BXIqHB+HucwSSNnPvXuhjmg8idOEjp5rOY3Vxuu
	 Pdh0caBbGydcZnDLkF1nH+iULC+C4XMN9DPwLZvMBuZxMwNLA1MMNjvnqeX2l15EMU
	 ZZyB9CFF9EI2t+GzOE5DjObq7kQ2NY2+OCGhWFEUeBKzCDBKaEuPlA/SjFmJQe/lj1
	 Bno3FMg48VIoeGiRZuXOFxp/PCk3O2BP+rMqYSETUoslwCTrpJ9NTmRCJZXlidMH72
	 DDl8VYp8TJkHQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so3087827e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 15:41:20 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywf7x4sTcQ2h+fxDyge7wWDJwc2LDZezboxNUneBHWPjFbbSeCw
	G/mGAEQLOmaF11ZGXtsmBWdnxN8jxCjAJfswVU3UBAEzNnwR0Qvbk3jJi5uFsC5Ocg7TivThVjr
	UQkEMyNUgZCq5UOI5GjKlGf/ryA==
X-Google-Smtp-Source: AGHT+IGB/Sd4rjYx8Bi3/wF6njI+DlpvXxohFsEciUvOg8VM2LcgfsqONsvDODcyshxGzZDKVTJKg2CyZRVEHcjG+eo=
X-Received: by 2002:a05:6512:3192:b0:52c:9ae0:beed with SMTP id
 2adb3069b0e04-5331c6e40ddmr720619e87.52.1723761678386; Thu, 15 Aug 2024
 15:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815110059.4912-1-tianyuanhao3@163.com>
In-Reply-To: <20240815110059.4912-1-tianyuanhao3@163.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 16:41:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOb=WvP85VN1R+ERj3pRnddwcDjwyW4OOx5vL4W6RC7A@mail.gmail.com>
Message-ID: <CAL_JsqJOb=WvP85VN1R+ERj3pRnddwcDjwyW4OOx5vL4W6RC7A@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: Only build dtc if needed
To: TIAN Yuanhao <tianyuanhao3@163.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Simon Glass <sjg@chromium.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Masahiro

(use get_maintainers.pl in the future)

On Thu, Aug 15, 2024 at 5:01=E2=80=AFAM TIAN Yuanhao <tianyuanhao3@163.com>=
 wrote:
>
> At present Linux always builds dtc if CONFIG_DTC is defined, even when
> DTC is provided. The built dtc is not actually used, so this is a waste
> of time.

That's kind of a edge usecase, so I'm not sure it is worth the
complexity. We could also just make CONFIG_DTC visible so it can be
disabled. Or make it a path defaulting to the built-in one. Maybe
Masahiro has some ideas.

> Update the Makefile logic to build dtc and fdtoverlay only if DTC or
> FDTOVERLAY is not provided.

Overriding fdtoverlay is not even supported currently. Adding support
for that should be a separate patch.

> Also, add an fdtoverlay wrapper to hide the actual path differences of
> fdtoverlay from the make_fit.py script.

That's ugly.

Rob

