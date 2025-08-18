Return-Path: <linux-kbuild+bounces-8501-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BAFB29D4D
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 11:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C48F7A450F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3815C30DD25;
	Mon, 18 Aug 2025 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kl/Antdt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498922ECE90
	for <linux-kbuild@vger.kernel.org>; Mon, 18 Aug 2025 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755508299; cv=none; b=FEGifQ/w8spC9kX2cvNVbOKzRaXuEv03skOs+UYmGBj29WcqJ4Ixx9wkXw9CS8m6fLMIsgSRhdvNFs2wtvu+Dj8FahSP0riNXlNzGz/s5xKCPdsBdOfeSAkx5RuNY1KVqajR09/zrYiCI/bhdJhB+Go4tEsry1YAtYYt5fMnq+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755508299; c=relaxed/simple;
	bh=DcnZxDmddaN0uXNCAKklDD8KhKB/8VIRPzW44qoA8sE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kViuzR7VxsH4YQw0Nq+JmxhceZBEDnb56ox4kjTYScZOcFw4219g2h4LF+ZuMFPYa+gqpw19cIwn0XmbJ1fgKXqgPPF2CIRVBWuy8Lcr/2xdyVcpgPimKwpZfkm/Lu6c8pBpJ7CldpWlFF+281sL4YnOtfDmf3wNwWD1097lsCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kl/Antdt; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-333f82a3a9eso34170801fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Aug 2025 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755508295; x=1756113095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcnZxDmddaN0uXNCAKklDD8KhKB/8VIRPzW44qoA8sE=;
        b=kl/AntdtMgU91z+uPQbU6HRtx6fU7cQir5rMkQ27rtYBNo7QzCHTgVp2F0ReYokG4/
         aZKoyKxIH7koVD5MI+szpXFBUxHRSjFWLwth1aUFo/ZxE3mx2LmtUbkzHbZq++Hcasfk
         FP1Z/FzMQ6ySFvgBOyDeuMTTL7gcCmAsUbqR5HzrDiyUhZnmncuiSdNCccHRibLHWgCF
         eXFfsf6B26ki2yBfeawCdcoBvFSUD2de60eGIy0fpgGzqVS6bJrDk/YxdS3VqAW3tyH7
         HIzu6ARFkYVM9/3NQdvAJwYgNEUQawe3yZFNOPVIPlZEjZ9YXBhctr2BcHRD9pNu2bhO
         EOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755508295; x=1756113095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcnZxDmddaN0uXNCAKklDD8KhKB/8VIRPzW44qoA8sE=;
        b=pxu21nBSDdIMaAq7BFBLQkp67YWvIfogopsEYuX8HaSXstQOC0fdcpbn8Q/sQ/spYK
         8g4qj7ieNzD4SrjDIGfJ6iwAmsB2xa1YrhTvIFqek2M+RzhrFdyvthS/KeEE6gSAjl/O
         wxul/sGez9GaDdcV+Njty4R+Y/cYZ3CnF7Fy2TmkLuAlB1yuTMz41uefauNB52Bl7JZX
         6wg/JOMoFDa0XRA08uHnEUGBS9EGXr7PdiLS3QHGFI33RnRTv7bR2QnCo7Kbma9p4Te6
         9a58HEA2bGoY7JZQVDjgZIBCR3kkDAoa7hXWu1mMSD2NeHgtGtSC+NzDSJuW8V820kXG
         xSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCfjxJyyJmk9/v3RN8jgzVdXbyzqbYlUck4QqWd6Eh0a9YOh2kfKmk46OjnxdwQ8j6CMLFZdPtfkPuEQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMlyLRDZGFVuKpm6QXFUe1mE9yg8w0/gIbv+vYrddNTgjxi7l+
	hJL5HDIxw6esPcaOLqHpWEY2lNlZtaPcGsoJFGj6WmjCEcYfz7Rl/hVohWlGe1N710jZutgvGEc
	ut15aRmQP70RzoR6raohgGgmRlf6dkyexm7G4NoiVzw==
X-Gm-Gg: ASbGncu604CBSi442IvvGJ6+2DLdohA14b8IbdIF0IIabiGcNm1hNVLQ1KydLh5u2k1
	CTsA39c++aIL/VIyItbkU2xTkWUBEPFZuR7CCSiOES+XgM0/3jmi97SkUdHYCzim3r/vwwYTRO+
	bnxvBTe/QrNcqeQ90qa5n7xp2tyyikXkzsVXpCmfeHfJLiLOfwWfnlfGzxL5oU1MHQK3Jk3d2AL
	Xw/z1SshFg8
X-Google-Smtp-Source: AGHT+IHgT6KsRzSnbopUtkS8cEhRfVfJ0+AHWqYOh3gWL/IW0zk5pe+bot9eWtYj+gnQIC499kzORbuEnGkUjOVjrWk=
X-Received: by 2002:a05:651c:e0e:b0:32c:be6e:6719 with SMTP id
 38308e7fff4ca-333fac4d04bmr33701811fa.1.1755508295256; Mon, 18 Aug 2025
 02:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755170493.git.legion@kernel.org> <e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org>
In-Reply-To: <e548b7761302defec15aa2098172eabb1ce1ad4a.1755170493.git.legion@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 11:11:24 +0200
X-Gm-Features: Ac12FXxtga8FCHwZMpHGt8XLiCGvlV2q8kZWzSqELDgp5nsspkpj9rrMqCjq2Ao
Message-ID: <CACRpkdZ9oyJ4aJ5Dcp_Dtv5qoiSo+g5cO7Uf4PmHgv_Z423onQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] pinctrl: meson: Fix typo in device table macro
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 3:08=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:

> The typo when using the MODULE_DEVICE_TABLE macro was not noticeable
> because the macro was defined only if the module was built as a separate
> module.
>
> Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507220009.8HKbNP16-lkp@i=
ntel.com/
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

This patch 5/9 applied separately to pin control fixes.

Yours,
Linus Walleij

