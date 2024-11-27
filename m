Return-Path: <linux-kbuild+bounces-4900-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903D9DAF55
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 23:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEB52166D49
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 22:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CF01D2F46;
	Wed, 27 Nov 2024 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUHkfjng"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D15013BC35;
	Wed, 27 Nov 2024 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732747843; cv=none; b=Nnt0fCfzkJgv/JuXaCPVUiDAzE7k3i/Hw76ck08jXebrDAsgZ9179h+0+wHnduit4eWZIoupawx/HutvMtWxzLlaXu8scz0rizzbTnOXkgtla6l+h3+/LFU6cBKxARoIliNf6O1OfgILVK/tTgqsdNtBlIFrc5RGH0ZJfcE1NI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732747843; c=relaxed/simple;
	bh=ULneaHu5XsG1bNb9u5DM7ZztjD79Q8B5qbqfYIeaB8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dv/3TJ4pLiX36uD1v1xGHOQi4Os2B12u4XNOwc1c9G6s5/NC0tWLsDfDGpSVZq4N1Z8LHVbQ4y0zKWbWrii33RLj6E+WgbaUBsFBI2FhU+ShZpK8RS/yUcH7J3t1rJ89xYJYsUamGNY4LXwbzzJXVw0LhRou1mmY+tN5ZnZ9LGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUHkfjng; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F1CC4CED2;
	Wed, 27 Nov 2024 22:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732747842;
	bh=ULneaHu5XsG1bNb9u5DM7ZztjD79Q8B5qbqfYIeaB8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MUHkfjngzvkThMVvwXUNW+vjySZfhqywwC1oAOv2PSOeSguMMf/DD6KTxhfBwsTyt
	 YlSfHZGk+ypuwGz1Q0OmU1dgXx2HLx1Rha5cjsT0LtueS4JwWHgKoKOlkhS2jHPYLM
	 kLs1vkHokBKyizFIo1ObfDDvN9NzbNEEsACnQIq+52Yss7vH1F2f/sxSj1xd02XcB7
	 HHNWrmUhnaHTpfE+dW8Lk1o9+UIVeVANdh1ADsJ6YkvwpDBhNjS8D4DLBk+eRMIrSi
	 Zc+ygeHn5tRN3A7k/JjO/BA6fpo2P5L65RbAT9z5I2L0nNsXKNzLXoNg3engBKSoHg
	 2okcwlYTYwWAA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so134698e87.3;
        Wed, 27 Nov 2024 14:50:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6iK4WPtlikmWov8hL2thNPHi5kq6i+FW7qAC+/tP20phXwvjqKE/hmp/8I8mn2Gt2d3exFTBLAKw28DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWO9MAHorvcHZCnvqCVD4UvLwtnjggvj01KcftMaksAkcP0Q/V
	sUTE1QFPh0YwrF4y+xXfjBeFS9qYy5IYwI4/Cy3nv8+Dc5JRytbCJPg65XVni7cOXF6HgL7KkFT
	UHyknmhUGhgpzlIkqKuRcSKVznYw=
X-Google-Smtp-Source: AGHT+IFs+onQv+mFqbDIw4n+DpkdhM59MFPcE4XY7zrx6tQY5Utufo6E6p425M+FyC3KDVGkNyl8VcbM+UpiDCH5Ppg=
X-Received: by 2002:a05:6512:3d86:b0:53d:e47a:1642 with SMTP id
 2adb3069b0e04-53df0104933mr1766867e87.35.1732747841590; Wed, 27 Nov 2024
 14:50:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
 <20241014141345.5680-8-david.hunter.linux@gmail.com> <CAK7LNASqqbNX652UdyO_MeLmcxsno-zHykeO1ff0rES=_PAOqw@mail.gmail.com>
 <20725773-8456-448f-a91e-f926d94bcb63@gmail.com>
In-Reply-To: <20725773-8456-448f-a91e-f926d94bcb63@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Nov 2024 07:50:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREx+QUT3BA5disV6kkq9uX1i8nZS_nRJwJZHHdGKCXHw@mail.gmail.com>
Message-ID: <CAK7LNAREx+QUT3BA5disV6kkq9uX1i8nZS_nRJwJZHHdGKCXHw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] streamline_config.pl: check prompt for bool options
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 10:27=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
>
> > As I reviewed in v1, this patch depends on 6/7.
>
> Hello,
>
> I am a little confused by this part. I originally understood this to say
> that I should put it after the 6/7 patch because it depends on it.
> Should I have combined the two patches into one?
>
> Sorry for not understanding.

No. What I understood from Steven's feedback is,
6/7 is skeptical.

6/7 enables many unnecessary modules because of them depending on 'y',
but most of the cases, the 'y' value is module-internal switch.

While 6/7 may save some false-negatives,
it introduces many false-positives.
So, I do not know whether it should get in or not.

If we do not apply 6/7, there is not reason to apply 7/7 either.



--
Best Regards
Masahiro Yamada

