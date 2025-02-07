Return-Path: <linux-kbuild+bounces-5657-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D1A2C04A
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 11:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1658A188BF3C
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 10:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643AE190477;
	Fri,  7 Feb 2025 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oQPa2Dl/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8980BFF
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Feb 2025 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923378; cv=none; b=rqRaQHSni4y1HZtR9IULwKOopr4gTzVu9PMYCHs5UPfjUC2pH/3it78OlmN6Uu74GL6sik6NjXxRdH7UloGhbcEkubwZzx45M/kn65s5uQE3gQPGX4W/vxmPELklMoQViG2p0zWYkIRPZzkmFY/AnH5sYkw23WqBqiqmJJ8sqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923378; c=relaxed/simple;
	bh=mdTv+QVDXPvlalZfbkGNrgsBW9vvfsm7zTp0oVSmMP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjtWc68wcKCIb3c3eXW3uEVBpeJr3Ydl6rVOuw5mX+3HeAzLLn/0k2yHf5s66buDsgcNQqMXsQK7m4U5XJtqZIsQKxA9IvGX/yyG8OFO3IscuBFs1zygZOylRBIJN6d+jGPW0k+gZRt4DlzhS3agey02+HJ2fADCw28HBw1Hakw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oQPa2Dl/; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4678c9310afso191201cf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Feb 2025 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738923376; x=1739528176; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kCUV7x43bWbCI/hcabQDWCnrCITBo3VvJAZs4rie/Wo=;
        b=oQPa2Dl//chZZlFgaQLXcSl7NGGC5z7c5+FFfC/Gl0sZNbPunGcPm5ezCaNiR+nLN+
         EGvZSlR+xulUBAZXU4CXXgVUEcRiAXfxcIyLkSqvQIHs/4Qff8XbUMsmeSfJbIfBq0oy
         vZ5oqZ4xW7zHm5qKOO6e9YXBuxj6nNvJHhuKBXvU/1ycwvMscKRFmzL+AxRa+OxtkBel
         A7iFpBUBVuz5S5NqDVWZayjeqNQJQRd8yZFJX86ncAW4K7plhkBJNpLZvq4QA5S7eOUU
         vQr+lYx9npNYP7Q9l40ZieGUv4+47KBz2knQJn/9vpN1mrPrzT7NVAT2TYjGFXlk6IH9
         QwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738923376; x=1739528176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCUV7x43bWbCI/hcabQDWCnrCITBo3VvJAZs4rie/Wo=;
        b=gpPr7NLHWsXFXWo+QLDxaGmlMTwoax7+DNddvY71wELagZBIHBAEUss1GAdshdICkn
         AL1GRA6jCSHom2D7qGdGux4HVoyXo5DJntT2WudFcGRmW4VZe6tQMkQI8qYNobOB5Ip9
         5RDANn0ydCsGPVGzJLMv+mFoxgJm4IkYFcyPwEvQQdEG0ObqXlDIumeK4ED7U8D6jCLZ
         WmLjJsqJkAJ+UJ1ALfDG0XLwnF/4n87mE/vRV4hnnhFHHdztFjDChSZcXY5HyG8eBPIE
         /uhpz4eTilZKy2KpSab+QXK3q9a8IKCT0mH+dnD1cpOisNthI628zJLBdDjmkeAY8P9s
         VDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWYPAN0Z1EdBEIZRcV/GZzWgaqJxSL/+C/qyq3Hh0MzJwRV6P3jxZC7ZWnSV+ZtWtQGYF3s7jDAiRBt/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8d8HBMmW2ZVb12mWspxf1qm4tl+PRpglCWut+4G+q+eix5osv
	qD6Mfanp4TTM6c6CJgLZC78Y9wSwkzWDqw7WfpJjBOV0UidyfGQ58iTayLtR+YEv1hKqSq53M0i
	Bry3/IW8pUIn34t7uKaaxayn18oy2USltS2QM
X-Gm-Gg: ASbGncsjFlURs+BtR1d6ayexTX9wO1gXvB9elJcdkSi2AzgG+6M7WFlbTp+hxaeRXqb
	IUb+vgKMHqS7xTql8XvOTlGb9D/rTzLMzeX2WyuF2Zmugt6yrRHpd4ZjgYM2T1XdCtL7rwsIwjF
	BGofB8SYAQt4b7r/rGOG52UHountU=
X-Google-Smtp-Source: AGHT+IGNBzvSf6Dx7xTDH8RzZIZRJ/MfxFXjZEpoZFDY8zOeAEieK82t+My9tday6P9m+xr4EBUG0yBPC8BUzCY0xo0=
X-Received: by 2002:a05:622a:13c8:b0:461:358e:d635 with SMTP id
 d75a77b69052e-471685b8925mr2831741cf.18.1738923375596; Fri, 07 Feb 2025
 02:16:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe> <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162> <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
 <20250131204920.GA1974131@ax162> <CA+i-1C1A_0nkY6G+W3n=dYqEJHZGuEwNXK=xrWNwDh7561x_9A@mail.gmail.com>
 <20250206171036.GF180182@ax162> <20250207025127.2sy74bhcu6wtbo6a@jpoimboe>
In-Reply-To: <20250207025127.2sy74bhcu6wtbo6a@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 7 Feb 2025 11:16:04 +0100
X-Gm-Features: AWEUYZlqVEPOKmDPwURyXi8JcqEovqZ4UT5KSclG2S9lxGoccrNZI3F2eMG33uc
Message-ID: <CA+i-1C0eNAMvRtZTZ8yNT2TwC1tgLqP=9T=t38eWdaznFoS+xQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 03:51, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> I didn't quite follow the OBJTOOL_FLAGS idea.  We already have
> OBJTOOL_ARGS which allows adding arguments (though not removing them),
> was it mean to be something like that?

Oh. Yeah, exactly that. Nothing to do on this point then.

