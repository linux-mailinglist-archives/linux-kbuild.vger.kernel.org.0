Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD9E6B981E
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Mar 2023 15:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjCNOia (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Mar 2023 10:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjCNOi3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2023 10:38:29 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21525CC1E
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Mar 2023 07:38:26 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CACA93F11F
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Mar 2023 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678804704;
        bh=288VuNJSsTmZZFRO0N0jW/xRk9rWGq8/Z/699waOGV4=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=T3RWIkTEj4yKHOABKS2BGaeioDzKtZLVPAk3VzB/XvZL9mtUhfPA4yDJWnVscOQ+E
         Ov8al6UPY4JJ4Ri0kAz8O1yNUYSanssEkfOK4T6jMVpBT+9Vx4av5+6raaSorxSzhR
         NOf6H30INCauC0EPFQnOo3Feiuilv6/j872TZ3GTfz97sdfJ3w5GnuRWDgsuqBL0ul
         ppJvozYR0wfVagu2lKEp0rVZTHouEzOlJu4RIuVOKT/pEAHjUbtLeMse3WVBMguaHX
         4xHkxVgWJ7QmIe0AdC/fo2WO5f/KqMptMOKmDu1Lj6gG5RIzOlnaLcNXlY9eWcS8rb
         dZECgNtAZFsOQ==
Received: by mail-ed1-f72.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso22242711edb.4
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Mar 2023 07:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678804704;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=288VuNJSsTmZZFRO0N0jW/xRk9rWGq8/Z/699waOGV4=;
        b=zOSrx3PvcTBYK9KqYtNYsd/g0Ef1/StVNoNMeiiAs3A3ZXg+ICdAMASEwcczT2nDSy
         6dtkVZ9ixASKN5L9Q12942xI4uS/cHMtEPhW/gVM3t4pRNe5DhPl6k+1VsXTHAWwAJGB
         ki9MiqKIm1PaCo649VjdlHaIIKOsn7IdklkJXLy6M5/svfMd0t0TZGlTiEC8TKD465+3
         IdO6BgEH6ZWynfeaW1Noe7bRqIarM00crb/45W58yhUYAWO4SOqXRlZ2mwzEkc5XfPgU
         O2P1cBvaKpG9gEjuQGSlyKSF0JgM/uXEUI29JEAmH1PpXRhPzYah+X1ES8XoAeYcbCye
         PThw==
X-Gm-Message-State: AO0yUKUKBPa4Zgcgro+DOjC8vIMy0Ht49AnZ67ilYqdKbLJqdHR5m13a
        2bR0cT0A5Y+NACd5cM6JYTikj2AJYI7gnxNyAeS0hSMOzBLLfD4VQrB3TJ10RuQcNIDROoXNvmB
        j+DVqOfVcgxkTA8K+ewil6N4sBTO64V5D/jzMwx9UEQ==
X-Received: by 2002:aa7:d402:0:b0:4fe:1b54:4351 with SMTP id z2-20020aa7d402000000b004fe1b544351mr1915034edq.4.1678804704638;
        Tue, 14 Mar 2023 07:38:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set/9UQPw+w9rgl+fak2wtd9z0XAPlW1SUX/vS1Y0goDh90JNitSGRt9qq6R5GMdI7yAfTMFM5Q==
X-Received: by 2002:aa7:d402:0:b0:4fe:1b54:4351 with SMTP id z2-20020aa7d402000000b004fe1b544351mr1914999edq.4.1678804704301;
        Tue, 14 Mar 2023 07:38:24 -0700 (PDT)
Received: from localhost (host-79-53-23-214.retail.telecomitalia.it. [79.53.23.214])
        by smtp.gmail.com with ESMTPSA id u19-20020a50c053000000b004fc537aec3csm1143462edd.74.2023.03.14.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 07:38:24 -0700 (PDT)
Date:   Tue, 14 Mar 2023 15:38:23 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc:     Gary Guo <gary@garyguo.net>, Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        rust-for-linux@vger.kernel.org,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <ZBCG3ykG1q4GEcIf@righiandr-XPS-13-7390>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <ZA+IUIOAgrWH2oZ0@righiandr-XPS-13-7390>
 <20230313214853.GY19419@kitsune.suse.cz>
 <ZA+bXi0o27XPx3nz@righiandr-XPS-13-7390>
 <20230313220234.GZ19419@kitsune.suse.cz>
 <ZA+fGpAdnvB5VwKW@righiandr-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZA+fGpAdnvB5VwKW@righiandr-XPS-13-7390>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 13, 2023 at 11:09:31PM +0100, Andrea Righi wrote:
> On Mon, Mar 13, 2023 at 11:02:34PM +0100, Michal Suchánek wrote:
> > On Mon, Mar 13, 2023 at 10:53:34PM +0100, Andrea Righi wrote:
> > > On Mon, Mar 13, 2023 at 10:48:53PM +0100, Michal Suchánek wrote:
> > > > Hello,
> > > > 
> > > > On Mon, Mar 13, 2023 at 09:32:16PM +0100, Andrea Righi wrote:
> > > > > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> > > > > > Currently modversion uses a fixed size array of size (64 - sizeof(long))
> > > > > > to store symbol names, thus placing a hard limit on length of symbols.
> > > > > > Rust symbols (which encodes crate and module names) can be quite a bit
> > > > > > longer. The length limit in kallsyms is increased to 512 for this reason.
> > > > > > 
> > > > > > It's a waste of space to simply expand the fixed array size to 512 in
> > > > > > modversion info entries. I therefore make it variably sized, with offset
> > > > > > to the next entry indicated by the initial "next" field.
> > > > > > 
> > > > > > In addition to supporting longer-than-56/60 byte symbols, this patch also
> > > > > > reduce the size for short symbols by getting rid of excessive 0 paddings.
> > > > > > There are still some zero paddings to ensure "next" and "crc" fields are
> > > > > > properly aligned.
> > > > > > 
> > > > > > This patch does have a tiny drawback that it makes ".mod.c" files generated
> > > > > > a bit less easy to read, as code like
> > > > > > 
> > > > > > 	"\x08\x00\x00\x00\x78\x56\x34\x12"
> > > > > > 	"symbol\0\0"
> > > > > > 
> > > > > > is generated as opposed to
> > > > > > 
> > > > > > 	{ 0x12345678, "symbol" },
> > > > > > 
> > > > > > because the structure is now variable-length. But hopefully nobody reads
> > > > > > the generated file :)
> > > > > > 
> > > > > > Link: b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to 512")
> > > > > > Link: https://github.com/Rust-for-Linux/linux/pull/379
> > > > > > 
> > > > > > Signed-off-by: Gary Guo <gary@garyguo.net>
> > > > > 
> > > > > Is there any newer version of this patch?
> > > > > 
> > > > > I'm doing some tests with it, but I'm getting boot failures on ppc64
> > > > > with this applied (at boot kernel is spitting out lots of oops'es and
> > > > > unfortunately it's really hard to copy paste or just read them from the
> > > > > console).
> > > > 
> > > > Are you using the ELF ABI v1 or v2?
> > > > 
> > > > v1 may have some additional issues when it comes to these symbol tables.
> > > > 
> > > > Thanks
> > > > 
> > > > Michal
> > > 
> > > I have CONFIG_PPC64_ELF_ABI_V2=y in my .config, so I guess I'm using v2.
> > > 
> > > BTW, the issue seems to be in dedotify_versions(), as a silly test I
> > > tried to comment out this function completely to be a no-op and now my
> > > system boots fine (but I guess I'm probably breaking something else).
> > 
> > Probably not. You should not have the extra leading dot on ABI v2. So if
> > dedotify does something that means something generates and then expects
> > back symbols with a leading dot, and this workaround for ABI v1 breaks
> > that. Or maybe it is called when it shouldn't.
> 
> Hm.. I'll add some debugging to this function to see what happens exactly.

Alright I've done more tests across different architectures. My problem
with ppc64 is that this architecture is evaluating sechdrs[i].sh_size
using get_stubs_size(), that apparently can add some extra padding, so
doing (vers + vers->next < end) isn't a reliable check to determine the
end of the variable array, because sometimes "end" can be greater than
the last "vers + vers->next" entry.

In general I think it'd be more reliable to add a dummy NULL entry at
the end of the modversion array.

Moreover, I think we also need to enforce struct modversion_info to be
__packed, just to make sure that no extra padding is added (otherwise it
may break our logic to determine the offset of the next entry).

> @@ -2062,16 +2066,25 @@ static void add_versions(struct buffer *b, struct module *mod)
>  				s->name, mod->name);
>  			continue;
>  		}
> -		if (strlen(s->name) >= MODULE_NAME_LEN) {
> -			error("too long symbol \"%s\" [%s.ko]\n",
> -			      s->name, mod->name);
> -			break;
> -		}
> -		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
> -			   s->crc, s->name);
> +		name_len = strlen(s->name);
> +		name_len_padded = (name_len + 1 + 3) & ~3;
> +
> +		/* Offset to next entry */
> +		tmp = TO_NATIVE(8 + name_len_padded);

^ Here's another issue that I found, you can't use TO_NATIVE() in this
way, some compilers are complaining (like on s390x this doesn't build).

So we need to do something like:

	/* Offset to next entry */
	tmp = 8 + name_len_padded
	tmp = TO_NATIVE(tmp);

I'll do some additional tests with these changes and send an updated
patch (for those that are interested).

-Andrea
