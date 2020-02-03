Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED4AB1500B9
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 04:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgBCD0h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Feb 2020 22:26:37 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34481 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgBCD0g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Feb 2020 22:26:36 -0500
Received: by mail-vs1-f68.google.com with SMTP id g15so8057006vsf.1;
        Sun, 02 Feb 2020 19:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=VXRtO7E8+XfZ8B/bR9c2XcFihrbguDmpun3RyDc6APw=;
        b=C02CtPWNFpcCoNhgOgnNW3jL67phNgf5gErTHAd85JFVuKZxWd8LW6pBBf/VHrZLj5
         wrSZCz3aKb0tiBzEu0Apwg1wG+OhmM8pDe5r8dc1ASxt2nHApM2EWNDFc25oU9RPRVFc
         yO/vD6sRXL2DWrUSHaf91hcFwxZG9ZHALJ1LHCEgYx8pUMnFjRKUnhvobiGQiS56IFOO
         mJHxjmPjKi/7xVVG9Jr1nLxjAX3h/PZ14Ie6MOd2hfuByoHQUjbz13fNh91b8hZcQ5Zp
         7gmnla1H6rTOLo0rMxuS5TXX35ycvEzVT5nzO/UyXRhoHYvRl5FTxluUg+6u8bfWUzhm
         82RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=VXRtO7E8+XfZ8B/bR9c2XcFihrbguDmpun3RyDc6APw=;
        b=Yl4738kY8v2u0x/ZBu2A2Y5IlHC80B7nPnRRFDtLoNv98o4drmcgjGkSdpsVYtrv1i
         FeEH+4jP8mvQIz7LbMsdmvglOXHSrQhcaAeWSmvoyvzcpor/SR1zcc4bIu5WGRht9Qei
         2bHziJwA0Mv3mxk/NLgSBuo5dzzbBBpdEK+FFmE5C7WUycJjayAFpzxvahD3wuRzg5Ei
         Xj/L1vbVmgPEYH8sPeiNhUR6k1fXYRhguYj1364HTfX4HHUn7OdufR18a/3nfmGmwcMg
         39ZtE/B+iB+6S0bycx05Mu9Rf+MKcPBxVoJA1IJJkSJ6DBLZzK+BMVG7SMdjXRgXWPIf
         +gdA==
X-Gm-Message-State: APjAAAUmlUH1crEYF6nC/CDDI0WkC2Rv+7h8UGvzhsG8x1lCeoT6xHjr
        CsYPpSoHNHRDP+7r2U5lCNFtdWR9H6QXYYQYxhVGScXBicg=
X-Google-Smtp-Source: APXvYqwm8J63Pn4S/RdTlqdqjAyycaCug01+tCM8+l/nzNtBAVI8yFMyzPtgA6zgxjVOxgyTrsq/0dmp8aQLgvcdLU8=
X-Received: by 2002:a67:f315:: with SMTP id p21mr14721502vsf.39.1580700394763;
 Sun, 02 Feb 2020 19:26:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a67:5d02:0:0:0:0:0 with HTTP; Sun, 2 Feb 2020 19:26:34 -0800 (PST)
In-Reply-To: <20200202050922.12402-3-masahiroy@kernel.org>
References: <20200202050922.12402-1-masahiroy@kernel.org> <20200202050922.12402-3-masahiroy@kernel.org>
From:   Justin Capella <justincapella@gmail.com>
Date:   Sun, 2 Feb 2020 19:26:34 -0800
Message-ID: <CAMrEMU9ZBAwOPsqeKw0sUF0EWnfO1-UtOKROD6T1AjYX_tWLXA@mail.gmail.com>
Subject: Re: [PATCH 3/3] kallsyms: fix type of kallsyms_token_table[]
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

unsigned char maybe? I understand printable chars unlikely to cause
any trouble and probably a non issue, but the domain is different for
char, and while I don't know of supported implementations where sizeof
char isn't a byte, I think it's a possibility and perhaps why u8 was
in use?
