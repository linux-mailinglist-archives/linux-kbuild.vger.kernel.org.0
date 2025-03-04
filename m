Return-Path: <linux-kbuild+bounces-5949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2AFA4D1ED
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 04:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A0F1174099
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 03:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6428E6EB7C;
	Tue,  4 Mar 2025 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Pk7gBwhc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f99.google.com (mail-lf1-f99.google.com [209.85.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617691DF73A
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Mar 2025 03:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741057752; cv=none; b=I9w9C2XPMEjXSS6YKh6W0O3mI7SERzRx5IcUytB3UasPaNaM44yvqci6aK7GNdLvDbHqx6+hsCaciAlBQA6/yMdUcSpsRwbj0paUGfRVrxcxLlOTHADFMYYYWryNPFiucRXN7tHK/G93tkHMG+OcSFB/RKt/Pr+G4tVwcv44/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741057752; c=relaxed/simple;
	bh=XAX5kNvACP91UXNcdnDTgumV4d/6JMem6vwatakdEKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvlwNa1Ygm/8E3nIYN1NKAHIWIWBSMFbuZNOvXoZeR1Oi2oo/K6OF+StCP8n3s9ODT3leHZYPCziT7z/WBM2OemjMvLpLacDi/Q3E6/fCYfAbbgyq095UeaRtAxg2h4eu/0IF5l9WrwXyDsS5O3Lx+5OoAIQcVju5zJ6KOaUr8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Pk7gBwhc; arc=none smtp.client-ip=209.85.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-lf1-f99.google.com with SMTP id 2adb3069b0e04-54965898051so1868853e87.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Mar 2025 19:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1741057748; x=1741662548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HaTgp9n3x/1hhkTDyIg3nxbnnDs0fCQyAsV1iOMog4=;
        b=Pk7gBwhcPx3mgF5r4tZAFVYbQvYWoMdodmlCjF3o//59/x92f9uKUsXyVfF4AKi29n
         +Ml5a5uqdoJZos8oi2aJy/JrqNzl/K/7sH/1G6XU7cwlm9yvzcIvsE68jyQVVuMv0JBp
         lgVC8yPXTwEW276ZLZlXyulNRiWZcRSo4jq94OkClhV29LcbbHhQw7vaoHhbSWRGy0A+
         mcTc+ViLQ0IUtHYc3atWkjn4R7sPb3wYHgJnKYRNgarakjX6ZHzh2d97THf9GGA/9J8y
         z/+cXRnbzDwfte0aKGs7EdK8hliNDNPpQhFfLggBkenjP+Z1PD4zH9ieznhye7Z4wW7g
         CKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741057748; x=1741662548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HaTgp9n3x/1hhkTDyIg3nxbnnDs0fCQyAsV1iOMog4=;
        b=KbdmPfodmOL1sFUqfpSRdMVP2BWDoPysatNtsKdL0+NS4eopJqwv1eTreMdefKfEIP
         I6JTijdtOAKSMcyEry1IfouJanrNF175YWqh3L4XGD17xHfvasb6xD4stGjnfriAUqgG
         81cphZfYUk1Z3k4/BjpG8OfUSArdR3qXomTrzveQURajK6kctrtbkSgtubZlGHMzIZMJ
         oUJRnDxh0bHyPG0h784LrQkdF4b/Rke04y8Jm1h18lxfSJf/9O0tMsjp5GWpqpuRtyUS
         fYHAV1l1gmoEHKc40yLdnWl73HSUYfJWDkfryUKAD1llvVsFZEdwXsYueGY7qBEpIha0
         UmFA==
X-Forwarded-Encrypted: i=1; AJvYcCXipH+hmqe7TUMfF6ZvOnf1j1owOhoBf031A4+aiNhZsiglB7VPCNNVvKtIxEmNOZoK6VytMO8U7ScyfGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvoX/R8sL1jcxFR0x26zJ0XfoxMgBpZxcqfvjs+mS7KwFQkwpN
	W4THTk4u131aRMnCZWKAg+kW2Lb8XCBE3EUkoiGv8e5U7qQ0yF7B1+rgpn3s8dblpoPRgcTomq0
	9E1G3C/NZOtam7h3izpmT6mS5X1TAm3q3
X-Gm-Gg: ASbGncutYOSsHV0TdX/3Wvyv+vUloocMGB0Dt5qwGn0REw/QdKS2WUpCtZ6Fva/3taw
	1JY9zzYevky/huPtZAnTfiiEi4uN3WJ1GBA1qMdir/8HZOb+2+MoZZx+WzKSiQaKyU77WkgAI9N
	fdmMBiNxmE0VBK6Vi5Dr4CAqcOU3gqrcztssiOZFXDDCOkgFC23FxIJNAIfMOTD3RdMupURZFuw
	/rBLZic6npya3BFXVTn2VjjGwWXpiYfaPcsCTwutTqSb19aMgE5Gm4lliQhZ0Kor/m3u6LuMLLf
	kTDhD87eVwwIJWs+hKCGHTBJmOQI8Gs5Qr7w8Z+Zo39S6xMbew==
X-Google-Smtp-Source: AGHT+IGf/IY6HezRQ43QtfLfekiv+xOizzvReIxLMI0ZMJ368PWxhP18LT82B+4hWSuhlPa4SQcohHFLjjGg
X-Received: by 2002:a05:6512:318e:b0:549:38d5:8858 with SMTP id 2adb3069b0e04-5494c124ab1mr5388036e87.20.1741057748190;
        Mon, 03 Mar 2025 19:09:08 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 2adb3069b0e04-5496a687c55sm132162e87.122.2025.03.03.19.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 19:09:08 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 3020A3400C1;
	Mon,  3 Mar 2025 20:09:06 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 45E45E435AF; Mon,  3 Mar 2025 20:09:06 -0700 (MST)
Date: Mon, 3 Mar 2025 20:09:06 -0700
From: Uday Shankar <ushankar@purestorage.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: improve debuggability
Message-ID: <Z8Zu0p2vCAfwXa/L@dev-ushankar.dev.purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
 <Z7Pv+hD3AOS/ymFI@dev-ushankar.dev.purestorage.com>
 <Z7zJ5EjIFLbz9C3I@dev-ushankar.dev.purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7zJ5EjIFLbz9C3I@dev-ushankar.dev.purestorage.com>

On Mon, Feb 24, 2025 at 12:35:00PM -0700, Uday Shankar wrote:
> On Mon, Feb 17, 2025 at 07:27:06PM -0700, Uday Shankar wrote:
> > ping
> 
> ping again

ping again again. Can someone please take a look at this and/or let me
know if I'm missing any recipients or if I'm expecting feedback too
soon?


