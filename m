Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301F16AAB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 16:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfGPOkj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 10:40:39 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:34845 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbfGPOkj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 10:40:39 -0400
Received: by mail-wr1-f44.google.com with SMTP id y4so21267553wrm.2;
        Tue, 16 Jul 2019 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dRTGM/3TsLLaMT/kkWfuAU6/FuLR8DlXkvNkWANUfp0=;
        b=cpVhmiXpBLbQXzEBXErmPUcmKX/FEHkp24b8zIdoKDLTPWatJQkxnkRQIw8rsDxtOK
         G3PsXiVuyNzQMZwA25oSu+41qhSIbt+GnbXU9fF0Rje8fskzVLOkeg73LHK1kVce1cNa
         Ln5ikH1NL4Tt1mfM3t83E0mJoUZPG7XKYD7Ba/AlJgwtfw/RmjflU3mdsHMcu7R2yUiY
         +AiGR309F9Wp4ndhhmtQ40ZpgoW99dsOKUOW1FBeJFXjB1KWmJnUGdJfbg7MK7Plx1kU
         6P85/TTr93TYrZw/714ACH+kG4nbUYacob/zQh4gCOpzWs1PSRwlr1Ns3OEZ9DLABDSE
         8Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dRTGM/3TsLLaMT/kkWfuAU6/FuLR8DlXkvNkWANUfp0=;
        b=Q/TzmFmiNoedxascjjbwPhEjL/exzigiefB9hnCjORMZ1rrJca2GdofRydtaI+c1DT
         lwf9YjIlppD39zY9aakEXvVCuxIGHxwTH9SDNqZPw2HcAxw2F2n7TpKjTOUzjIPQ2K2Q
         GFb8s0EAh+IHblrbr62xQMeUAPBWb5RcgWFkO8wGlzhCpCzTIMKzMhe52dsrk8NGjgix
         G4wByehIXIFjthzw1Lubq50tHwOd5kSzZgfhWCseNtnyxiX/Wsq2eH7WpV7ONvvFF4A/
         AZwFxV5OWzFik532mlz0067ABZroqxN+6ACleqUfsUB0zbSOR6ecegwFB6gQQSrgDELJ
         BjWA==
X-Gm-Message-State: APjAAAVxbSBl0ekHrkFF362ChJVfykZLiLRq83C+G2yXbTJ5TiJJdtYC
        8iTBIm6S/K6fP3LbYFSaxR0/VbNe
X-Google-Smtp-Source: APXvYqwYrVeoLHI+ZhUBAEFqoIBYN16pQRhPsaikeBnrvmYoZlXI/lqIwDwPGeupq1aCCuPeXODFOg==
X-Received: by 2002:a05:6000:12c8:: with SMTP id l8mr37775498wrx.72.1563288036993;
        Tue, 16 Jul 2019 07:40:36 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id n14sm35148654wra.75.2019.07.16.07.40.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 07:40:36 -0700 (PDT)
Date:   Tue, 16 Jul 2019 16:40:34 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: kbuild: Fail if gold linker is detected
Message-ID: <20190716144034.GA36330@gmail.com>
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Thomas Gleixner <tglx@linutronix.de> wrote:

> The gold linker has known issues of failing the build in random and
> predictible ways. H.J. stated:

s/predictable/unpredictable?

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
