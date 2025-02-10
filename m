Return-Path: <linux-kbuild+bounces-5692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248FA2E39B
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 06:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 737207A3CAA
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 05:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D121C191F89;
	Mon, 10 Feb 2025 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shtXieOH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3F191F6C;
	Mon, 10 Feb 2025 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165065; cv=none; b=pi61YgdT9HWj1+vJ0iMt7tGGXY8sWbc5kHKmaeNcCNW1FjGVG2n1Bkbt4io7zxvtV1OfGw9zjVi63lbHCRmMtVgB7Doc9NaMhfvlEKzRVRm/QmQGSB4dFDCyeifCq06aAub0PJTFCpPLTWMZ/XXiLKCX0c3aEJFmvkrewshQI7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165065; c=relaxed/simple;
	bh=4c8uDtQAY9kfRW1TDHSqKBQO5el36v8MvCAmDhgbXfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xibu14ylnBAnyqQsPwzvSZCmIwWg4Y29i1sDfRHU5C/NNnqb3dh4FsEXw/QzaA+zKIEIUoB0+cHi8kEA044yGMkQKY3I+DTqdu5ZryOfvo6gU671d68roy16vCbY5E2cOpiuhjCbI05La+JO84C04ojbcMgHwpeDzuw9E8qDcMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shtXieOH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C962C4CED1;
	Mon, 10 Feb 2025 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739165065;
	bh=4c8uDtQAY9kfRW1TDHSqKBQO5el36v8MvCAmDhgbXfs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=shtXieOHyqJN3yvPftSKysTX09hcEkZIP7tLiv8eK2evexm1IFc4lE9hRvUGL3ZxF
	 rB2eJDgrMQIThXc8ZFkLnIYp2NtP9TERLyymPGUDJ13c2xlTPMJ2KEFbu5Qh5Jufrq
	 De8ThrQAfjm3H7KJQ53aRxUhiiZbThVX0nk/BLSYEUGMgxpIc7/532j2rCnQcoq67z
	 PVG35njPY34U2WiIWjx1EHHWthMYEYo9A2YRK055cl4QPev9h2MpIPM06t2WCsSDEc
	 HGf1iHyc1bRqUWKm2ia0MZT9+czOSd64xm/ujbbP4VeYAdL1xnTmOrvJAvE3MqA371
	 r5DrswqA5/9tA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5450681b606so1283207e87.0;
        Sun, 09 Feb 2025 21:24:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwXWXDPbOzBGrPCRbOkRYf4bt3VFgEwM4Oxy/5zPJqVcTLEUagvahIdsys4yNjTBjG9xhmkWYsWWXAiYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcy6NCaEVe+69co/baQmIujFhvNIf7m59wPu7WiZHfr/oVOOoT
	um0OEpfK3OJxTsrPIOSDKK2JX8XI0AIXpp6yswpTY50mda1zCeKXfJknDypcTyV2k5Nw49CcjNF
	qewpNiOP7kQ+3zme3jEkSP8dSgUE=
X-Google-Smtp-Source: AGHT+IHe5ibFtZ07D49GfwQIFfd+xFw1bGzm/wYK6D6b5+fEs0bQgthgBex2e/XOMAZwMwb9/CAj3TcWqBqB9bOEJjQ=
X-Received: by 2002:a05:6512:2244:b0:545:8cb:218d with SMTP id
 2adb3069b0e04-54508cb2353mr1249428e87.41.1739165063812; Sun, 09 Feb 2025
 21:24:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de> <20250108-diffconfig-validate-v1-2-4b3d8ee489da@linutronix.de>
In-Reply-To: <20250108-diffconfig-validate-v1-2-4b3d8ee489da@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 10 Feb 2025 14:23:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQbgn+gv7JWmj7erzwnMU71Mb+6LGiwOHcRsprdFnjbyw@mail.gmail.com>
X-Gm-Features: AWEUYZmvmDXz5rtg6YjN3W00r3poQFCBcWSDyE-DjkFagRyTMuC-3wl5BE96TOs
Message-ID: <CAK7LNAQbgn+gv7JWmj7erzwnMU71Mb+6LGiwOHcRsprdFnjbyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] diffconfig: add verification mode
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 9:34=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> When creating kconfig files from defconfig files or snippets some items
> from the reference config may be silently omitted when dependency
> constraints are not met.
> Manual validation is necessary to make sure that the expected items are
> present in the new configuration. As the constraints can change over
> time, this validation has to be repeated.
> Extend the diffconfig script with a validation mode that can be used to
> perform those validation easily and in an automated manner.



This is a niche solution and is not worthwhile for upstream inclusion.




--
Best Regards

Masahiro Yamada

