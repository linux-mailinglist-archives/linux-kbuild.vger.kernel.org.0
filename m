Return-Path: <linux-kbuild+bounces-3328-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE2D968CE4
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 19:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D181F22D61
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 17:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726441A263D;
	Mon,  2 Sep 2024 17:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUSE/+Re"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFE1CB508;
	Mon,  2 Sep 2024 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725298815; cv=none; b=TNok4WfxrfqJ1c7+fjJydrbGuznC8N0fOyxYPVB/lh4iRqkRQMhhyBbRVmDMYnbQ3zYmBsWfSriPDnC5wsVVnGm9fMFey5WYbjHsUx+oiWICO2Fa2qv1ofQENXOoHJ6hgjbcsj+Y88e5+3N046DMM2vIeIbajiqDTX0hGPgA3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725298815; c=relaxed/simple;
	bh=HBs4C1YpOhw80pOB6SXY9L19aCPNafrPulLVQGMWfiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7lMSgFWRUKL7YGywErH+vYhJhIhHwyWo3a7QvSl+Sp1ujsceflp9N2iB0jXR6pa/ZtIfA94u75Yo2sprd7SO/+0bYwoxJ0Cld7BbEmM2amMN7XdWeAV0M0piSOl1U3F8iBcgq03RwaRF2ez1HRLMziqWlWgMgUntOm6PqLcvlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUSE/+Re; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71428f16b09so263972b3a.0;
        Mon, 02 Sep 2024 10:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725298812; x=1725903612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVAMC1/G3+ekR0YyzFtCAEDUHcSAt3pXnMJFe7EYTDU=;
        b=aUSE/+ReeMciKnauPu+of//jL/jO/HPqlWpRhgy3zxRysve5sueJLMbU1Ior1XhHV0
         oQQOrEY8i8RwDnncXOihWsEzQ+KSaNs1E0u1AUJD1/mTTbe4IdFHktmKVo/9TJoXLQQZ
         8/YVVrczMQfqNJhdMtzl+yHGU+O/C0DylKZ8K+JweTDRCX5HpwFVZkmPwaHJA4aUkFh2
         XVi/avOJdai9gDhoLgPYpZfqNNGf2eAA0isuezCLiVmtrJ3Vkxx7OIwj/JcAkhWlwvdV
         +efAZU7s6pOlzwvwJV1vmB7wTwT/tc25spABRVOFDiseiYTZSHTEEGkRIvRrg+ahoCas
         8aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725298812; x=1725903612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVAMC1/G3+ekR0YyzFtCAEDUHcSAt3pXnMJFe7EYTDU=;
        b=oEdXZvj1D4hACtiFswfprVlxihgRM93asqBnIznHGSo7yF+JBM9u1pT6A3Rmp5+qMo
         /fEXNgYT+cGt72OoH995UrKV9K7+SW0/6bjmduvOm89EgBRmQEPS3J9Ke5hXRvQqyUz2
         jnP4YYjdo5+GjYlAxpYy4C6MjI9PNWgzvik1AbwZ9sPuspG597a7pDIoH8CitM+V+Ho3
         uMyifNA3BAyIt+KrSKLjnVhWGb7hcu8bGWAQfIRzI48IwlwjbTCJ0QCTMlEoGab6fa7Y
         2YwdbOLtUHZWODeA8Br/cMhWKaQkafFUP+5LIbkxnF+0k7QjlmIqOwsYBSqt7TwNGrA6
         X6Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+zXFD6z0f8j1KpUauERgIHRU8dKd0XzA5L+Iq/iuX2IgPusxdzYWeaRHFv5IHhR6sNmuPWh6qzY8lkk=@vger.kernel.org, AJvYcCV/z/RcoablV4ZJliVSfQZ505LLwaWO3HW4fIBukLAeYogJpGx8uRXRXsQTKGd4WsoBXGx5jVOYKKVLH0UAOpI=@vger.kernel.org, AJvYcCWP+OuSy9tKXELWHmGlK5dkRq+C9ZjrslwjEhYFcVmU8gJNKDISVUIMWO6rHv/LX9+uT7e+jx+A0TaGO4YA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4mftS2SA2/+9hCdFD9lOBJNK5a3wijjoWyw79377N3891WZCk
	RKNAWcPOKU48EtBbX2uAQjRX8WZmB6XvVxo8HnxIR23i3uOuY5HQvcsO0PB0CY1+72gFKlFsNxp
	7+QYlTcOx10St1o9a9Ql8ZFu39+g=
X-Google-Smtp-Source: AGHT+IFcIl+gz0XdiG2Z5jROYRwruDz8uSHuM8r4esBBGXdGA8l1J0fJAPNwGCzbeTtoPcYziXWsqrPDd7GqFqoVzWQ=
X-Received: by 2002:a05:6a21:3385:b0:1c4:af14:d9a4 with SMTP id
 adf61e73a8af0-1ccee3bc42dmr6232439637.3.1725298812608; Mon, 02 Sep 2024
 10:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-5-ojeda@kernel.org>
 <20240817-cute-doberman-from-shambhala-6f42db@lindesnes> <CANiq72nkBoiLUDQjBZi57OYwMpnH8D5Q4wR7XKWMry+mdwFOHw@mail.gmail.com>
 <20240817-ambrosial-zealous-reindeer-de0f25@lindesnes>
In-Reply-To: <20240817-ambrosial-zealous-reindeer-de0f25@lindesnes>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Sep 2024 19:40:00 +0200
Message-ID: <CANiq72mPaLb0NSQ0Y7VMrQQWm6NO7Ejauo3S_3xZG9Ux3cpfbQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] kbuild: rust: rebuild if the version text changes
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 5:50=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> oops, I missed that 'core' is delivered external.  Sorry for the noise.

No worries at all, thanks for taking a look! I appreciate the reviews.

Cheers,
Miguel

