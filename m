Return-Path: <linux-kbuild+bounces-5190-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 933049F7962
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 11:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F94B16EA17
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 10:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F6D221DBB;
	Thu, 19 Dec 2024 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hihoqEgr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E281222591
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603546; cv=none; b=SgEdttj4atlAl5RfAB59+FUr06r/1V9Z3JgGt9fR+oMwfo9LchebySmE80yzI25YnIzGgcSh8B5X5RHENBywAHd4uxi1z3eneLqcYouMxAeao/qNK/QvaQ14Yhs0bMAkzWJXAjOg0yyHas88KKm7TRzgEB2L658s8LRCcCknw9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603546; c=relaxed/simple;
	bh=5s46Lx8wPW6FQmIAJTy79x4iTnyqYAlN02MalO8e+LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbxmuqEm5UN+ixX7UBI/H99CL0Hnc3uv55xdXWbuxSqiTowzIjImOZBspTTpGAIi7hjcAgtsI5WY7UIQvzkcIz0rbuCMu1GQ+udp9lLIWfOvNKvYB9GwhjaFkIMBscAsNOsLx2NQJo7zMQ8BOyBw/UbIKOfScxDbLLUFI8qqfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hihoqEgr; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4679b5c66d0so170311cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 02:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734603543; x=1735208343; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5s46Lx8wPW6FQmIAJTy79x4iTnyqYAlN02MalO8e+LM=;
        b=hihoqEgrUSx7U1jbWpXk6UD2y1x8kvqWocr6eROcHrz6KT+bzVYc5jNc9OT+WKz5M/
         kRA/tQ+RjmaFmcWxiCJzcdiZkiZ8CwWeRMDAa+vV8OoV9OsKBBRNI939LCAqv59s4+fv
         UGOuL1ya21i2w8kiJvfEMBUHI8tQzKf/r8X1MA0KJ7s5+eM7e606YbTHpkC7x2grOAt+
         iS3V09X/0FTU26f3tD2Lu0+2vAZjTIP6nuiLD2NtbUvDAZmLcvLXyLxPdnthgK28LT/1
         1pJkHTUZqcGY9zgxcEJxC5q/i6VoOkyzgZshuY6tpUv0hGq6U3httMp2Fb4D3aOvzXzG
         zqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734603543; x=1735208343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5s46Lx8wPW6FQmIAJTy79x4iTnyqYAlN02MalO8e+LM=;
        b=O2oGmRPjjNofiVWleYuEghZbaekq/Mfp/tFKckpFrfM6LXNvViufH7vuCBhseepJSo
         pPxmYFJji/awEKrNjptb/xVp/O2ULpRYu+7SgHC8IuJFsH5fH6wAx/ufFCcXIp9D24Yw
         IGshf6bZb7syRLpFKoiL1qG2hFb7L8w/Kbdmuc4RyloQp8Kh8/feY+x35JbBKbktaxAn
         +Y4OKNNRXKqatN1h4BG1hJjhyugUhDwEYNf4ddkCkxNRF3Qg0BPZCiEFvP8jTyaw8uDH
         PnJtkUlhBNHcV6dvcOa6TojMrxCsLhaXndA/ykW49uzML9d34iDLC1LUgqWhTSQLIJfj
         //rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOuPt+R0637Q2AggU+Tk3dUZXGg+bLheW+LLUzQr+TtryA53Zssbk67IsA1eWZQ6AP13mvMpanOUaAofU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5JxYIbhpTXUFbonA9OzlwOrl11rlyRrbNVlE3/myXARKxEDRu
	A9VMPyACjEtOS1H+SuE5QZnsK4cShBeGX/FtajogF3Fs+VrunW5sbFxzlzS9eo3YP9Vb2ibITGL
	GZqF3Chx1+JcS6uiiiOWwaFo18ZhednngBzMw
X-Gm-Gg: ASbGnctKY3S2y5fRbwRM23RPuWXDWmqa5GBtQbpu1C/6H3X1XH5Z+tLybWJpz7a4M/d
	G8626P/jDtE44jHValmHkt57kyE47JeOWTtY=
X-Google-Smtp-Source: AGHT+IFBSKmqI7VdKTF7Shu01LIAOnSYZ4niZTfoNrU7z66Tl6ZodA8N35DTP9RCqTA5kzhdyBHlk50oFp5OT1KJQtA=
X-Received: by 2002:a05:622a:189b:b0:463:6fc7:e7cb with SMTP id
 d75a77b69052e-46a3d9880a0mr2176241cf.11.1734603543175; Thu, 19 Dec 2024
 02:19:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218-objtool-strict-v2-2-a5297c961434@google.com> <20241218190406.gbemqsbf3rxtione@jpoimboe>
In-Reply-To: <20241218190406.gbemqsbf3rxtione@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 19 Dec 2024 11:18:51 +0100
X-Gm-Features: AbW1kvbmAyvP9XO2mgM5Vrykn6IpcsUixZ0Hch4wGc7cR210rdkFQKXut0NFlbc
Message-ID: <CA+i-1C2Gfm_VQUeHrV-FVZY-DPhy0_VyBdMKMuYj1T+0ODQSTA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: Add option to fail build on vmlinux
 objtool issues
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Dec 2024 at 20:04, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> The patch looks good to me, though the subject and commit log still need
> to be updated.

Agh, sorry. I'll wait a couple of days before posting the update to
avoid spamming in case anyone wants to weigh in on the discussion.

