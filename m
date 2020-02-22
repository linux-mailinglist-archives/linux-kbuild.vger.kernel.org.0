Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE26169126
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 19:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgBVSMw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Feb 2020 13:12:52 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44448 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgBVSMv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 13:12:51 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so5011582oia.11;
        Sat, 22 Feb 2020 10:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hihCTLsn58SiIEuraoW0VJp1oBOLey3E988oD/herXE=;
        b=pDm+h/yZOxgNP0sCWlGw+uv0LKtdiOzmQ/JG7uUZFkHm0WDj4PuF8bs10JQlmws8d1
         63LFOgPS7PM5+REmNvBwUkurhlkDjKkEpIlgzNVEKZ9uUCrLszkUSnL1Yu+H0qKLe2Ia
         rn+t7406yPSOSYTKq04Gn95RW3N8awXyxYt2Ja09Q9s5C+C0aOlELc5pltv2PnI4p/tA
         DjpkwuvYEb8O6b23S894BAuqairHU4Xim11BtmWQKe4cYIivIvHQM8rgo8Bl+xzpRGB0
         T095umF98MB+tupWeXqtjL9JU0yJfTJF6udVkfVdT2fSxIBkPyMlkW5YABdUTakqe+ft
         dCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hihCTLsn58SiIEuraoW0VJp1oBOLey3E988oD/herXE=;
        b=nH+BZNjim8rEKwoafPz+z6BfLO5S/8Y9eMozSj7CTYygDoUhnxmVCemsjEKxhBbIDs
         S5wyj5YxOUox6zK9SHvPR6JfaUayAM2C0zr0mSAZv1+AydQAAjmCEhpLDWXFtpoXedwB
         i/ZliHyAObQAMV1DZLmKp2/Z3UQ1NgezkhsfZ4fqh5E10KuzP5uVg3EjNgcSRf/jrior
         5p0bwOx24VjKwJ8ttaR1dYjetZdTMc4sKDH44SiCGK/8NWClpZYWDD6ikeab3xWp9p1v
         ui89nZp18kPwetO7GaLdWCjL2ZF3btVSO3GJmYrD7NFwTMCP0mA18MBLmp6FvVGoK+RV
         WeJQ==
X-Gm-Message-State: APjAAAXkDCwq6+Ui40gYGf3L2SK4gGi0cMzUO2uBKvR28OoS2z9tD9qB
        hd4VYV7rZH7C3+6cOlymG4c=
X-Google-Smtp-Source: APXvYqzJ0Crd1ggjKEJY+mR1yAlXQFP7CMlJSf4HMNFeSEYJb6VLqXC3bgriO6S0rSeeYP19Mqwxpw==
X-Received: by 2002:a05:6808:b23:: with SMTP id t3mr7106123oij.88.1582395170927;
        Sat, 22 Feb 2020 10:12:50 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 3sm2451668otd.15.2020.02.22.10.12.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Feb 2020 10:12:50 -0800 (PST)
Date:   Sat, 22 Feb 2020 11:12:49 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc:     Russell King <linux@armlinux.org.uk>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
Message-ID: <20200222181249.GA23843@ubuntu-m2-xlarge-x86>
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
 <20200222003820.220854-1-alex_y_xu@yahoo.ca>
 <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
 <1582341758.yo66djba3t.none@localhost>
 <20200222080140.GA40311@ubuntu-m2-xlarge-x86>
 <1582381271.1karmgahx0.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582381271.1karmgahx0.none@localhost>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 22, 2020 at 09:24:14AM -0500, Alex Xu (Hello71) wrote:
> Excerpts from Nathan Chancellor's message of February 22, 2020 3:01 am:
> > I used hyperfine [1] to run a quick benchmark with a freshly built
> > GCC 9.2.0 for x86 and aarch64 and here are the results:
> > 
> > In both cases it seems like performance regresses (by 1% but still) but
> > maybe it is my machine, even though this benchmark was done on a
> > different machine than the one from my commit back in 2018.
> > 
> > I am not sure I would write off these results, since I did the benchmark
> > 25 times on each one back to back, eliminating most of the variance that
> > you described.
> > 
> > [1]: https://github.com/sharkdp/hyperfine
> > 
> > Cheers,
> > Nathan
> > 
> 
> What kernel version are you running? Do you have the 5.6 pipe reworks?

No, it is a stock Ubuntu 18.04 kernel, which is running 4.15.0.

$ uname -a
Linux c2-medium-x86 4.15.0-50-generic #54-Ubuntu SMP Mon May 6 18:46:08 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

If you are curious about the specs:

$ neofetch --stdout
nathan@c2-medium-x86 
-------------------- 
OS: Ubuntu 18.04.3 LTS x86_64 
Host: PowerEdge R6415 
Kernel: 4.15.0-50-generic 
Uptime: 126 days, 12 hours, 39 mins 
Packages: 686 
Shell: zsh 5.4.2 
Terminal: /dev/pts/0 
CPU: AMD EPYC 7401P 24- (48) @ 2.794GHz 
Memory: 2974MiB / 64018MiB 

Cheers,
Nathan
