Return-Path: <linux-kbuild+bounces-634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4905B839BD4
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 23:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5911C22D11
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 22:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BAC4E1D8;
	Tue, 23 Jan 2024 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aahX9mkj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527848CC5
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2024 22:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706047671; cv=none; b=WycH4sUW87aq0AH/IMRsbV++dq9cf6md25ocjddbxAQ0IoD5ho+9UJ6YOffD+BuPtcExAOQcN1QX+DuySRLSt8wKAwEdf72YU4U/P75HKoZlkyCQ2bPbkaYXwbNOmmfX1WeT2bjdhTshfoKLy6nvFgk6KLI2V0Vsb3STtyjQpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706047671; c=relaxed/simple;
	bh=cQsmHFZVWyInCHAn5Rn6vdAZZg0p7mPVL/S96zJH1os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDZDzJg8Ch0duDM+xCTpQE4ILysAeHZPaO60GG2jzzVGUN5LNmlqMDZRy2edmBwvUF+E8Ht0zVhP6noC9LgE+NnkCZ6ttv3pY1fBe13QswUAAKMcyhvFWGsbBD8F+4edIFt5LlSys8pbfMKgcIQv6A310NJ4xiMPUDCVQvQ7Czw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aahX9mkj; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59969ec581aso1997797eaf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2024 14:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706047669; x=1706652469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8pjbL2bDroOgNYlLsF17lwitb94Mh3o4FZHdBe9FHQ=;
        b=aahX9mkj7G1HE6j4hjBnByxy20IjUfghiBQoAXD/wv437Usjnhg2HrE0zkHYu/1kGy
         APOCRq/Tr1w7jh1NFQV24xLrEARtrL3HmyHgCOVqgb8OZblb2mHs+48S4NMsaIOLnRqj
         ij21FicrmD/HZrk069NJDizRIP+ut1RaUCpGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706047669; x=1706652469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8pjbL2bDroOgNYlLsF17lwitb94Mh3o4FZHdBe9FHQ=;
        b=LvbEHj1lNQQ8zKPQuRWHaWDRY4ulb+x+F+gJ2tfaeglufNHpD0uBPkmiViWiSUMRdZ
         23r94tEH2v3rVbco8Bsam44/UUXWiR2mxojfziBQZW5x9bstX+0lUjU9aNuQdA7undDc
         Vazrst46Pr/j2Fg4SVF10DynC3pBXUg/5PwH52YSB53FcSp8tSuFM9L8Cvk78dhcJ+DN
         dAPPPk0jHDB9jz1xP0trN5QmsGgO5GJk/z+cAzpUU6iZkZ6/ryI3D582qb7OYXVMvmKT
         2l+XHjG1uOFhsW3cy2gFZJY/XhxGKO6qlUTVV0cWb7yIuKVLlRISXkwv5+/ltjA1b1iK
         1+ZQ==
X-Gm-Message-State: AOJu0YwO5ugc0cvV6LQlYLCiAO03qUXmgDsvJOi1Tbjntytosu2RmxU3
	2rUBQ0trNc1SFrVNvxST0UyTVXkGYrJg2H3LVc1EyUDGFJmV7lgPfXw+Vlw/Lg==
X-Google-Smtp-Source: AGHT+IFWoD+lnHXIttBjzZpwoHm2cRiXjARLx7hiQl/YiDKkh3Ptob0qZx9MDjtL1L/zXzjZLUMhUQ==
X-Received: by 2002:a05:6358:4403:b0:176:4f31:75de with SMTP id z3-20020a056358440300b001764f3175demr3422258rwc.6.1706047668782;
        Tue, 23 Jan 2024 14:07:48 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:81da:d4e1:ee51:c4d6])
        by smtp.gmail.com with UTF8SMTPSA id t8-20020a63dd08000000b005cf450e91d2sm10500903pgg.52.2024.01.23.14.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 14:07:48 -0800 (PST)
Date: Tue, 23 Jan 2024 14:07:47 -0800
From: Brian Norris <briannorris@chromium.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Julius Werner <jwerner@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	kernel@collabora.com, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/4] Allow coreboot modules to autoload and enable
 cbmem in the arm64 defconfig
Message-ID: <ZbA4s-gg4o5o7ypM@google.com>
References: <20240117-coreboot-mod-defconfig-v3-0-049565a27bba@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240117-coreboot-mod-defconfig-v3-0-049565a27bba@collabora.com>

On Wed, Jan 17, 2024 at 04:03:21PM -0300, Nícolas F. R. A. Prado wrote:
> This series adds the missing pieces to the coreboot bus and the module
> alias generation to allow coreboot modules to be automatically loaded
> when matching devices are detected.
> 
> The configs for cbmem coreboot entries are then enabled in the arm64
> defconfig, as modules, to allow reading logs from coreboot on arm64
> Chromebooks, which is useful for debugging the boot process.
> 
> Changes in v3:
> - Merged all "add to module device table" commits into a single commit
>   which also changes the coreboot_driver struct to contain an id table
>   and avoid unused variable warnings for the id tables.
> 
> Changes in v2:
> - Added commits for vpd, memconsole and framebuffer drivers to add them
>   to the module device table

For the series:

Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks!

