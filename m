Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43056BA0A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Mar 2023 21:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbjCNUYF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Mar 2023 16:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjCNUYE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2023 16:24:04 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7372A6F8;
        Tue, 14 Mar 2023 13:24:01 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0A52B21CC8;
        Tue, 14 Mar 2023 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1678825440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vcexmiQDIGjEczWxOqfizqF7kSZwJ4krojfVt+WhvVU=;
        b=O623N601B3RRv/A7XI7b7CJ0bD7MjAkAzkaVWtLC/vZSYpXxVhwulhwl3s0tSdvjQT9ovO
        w5pO0s5MYxTqu6k5oEzZQWVecBo1ZG+eJP///yXp7pRCZgFAS+I56aQEcnZdoZRZ6/mvyV
        TlHP6dGaVJXciRDeI1diXK6E9R9873Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1678825440;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vcexmiQDIGjEczWxOqfizqF7kSZwJ4krojfVt+WhvVU=;
        b=VO4nj/9ttu8IbT70Di8v+zl8X2Rw+6w9p/gSyyCcL/G8/lwAAvptYcAYC4grbPAihBiW30
        +mlM0bH9OT0N7OCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65AC913A26;
        Tue, 14 Mar 2023 20:23:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Fs2ECt/XEGS1XgAAMHmgww
        (envelope-from <mpdesouza@suse.com>); Tue, 14 Mar 2023 20:23:59 +0000
Date:   Tue, 14 Mar 2023 17:23:56 -0300
From:   Marcos Paulo de Souza <mpdesouza@suse.de>
To:     Joe Lawrence <joe.lawrence@redhat.com>
Cc:     live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: Re: [PATCH v7 00/10] livepatch: klp-convert tool
Message-ID: <20230314202356.kal22jracaw5442y@daedalus>
References: <20230306140824.3858543-1-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306140824.3858543-1-joe.lawrence@redhat.com>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 06, 2023 at 09:08:14AM -0500, Joe Lawrence wrote:
> Summary
> -------
> 
> Livepatches may use symbols which are not contained in its own scope,
> and, because of that, may end up compiled with relocations that will
> only be resolved during module load. Yet, when the referenced symbols
> are not exported, solving this relocation requires information on the
> object that holds the symbol (either vmlinux or modules) and its
> position inside the object, as an object may contain multiple symbols
> with the same name.  Providing such information must be done accordingly
> to what is specified in Documentation/livepatch/module-elf-format.txt.
> 
> Currently, there is no trivial way to embed the required information as
> requested in the final livepatch elf object. klp-convert solves this
> problem in two different forms: (i) by relying on a symbol map, which is
> built during kernel compilation, to automatically infer the relocation
> targeted symbol, and, when such inference is not possible (ii) by using
> annotations in the elf object to convert the relocation accordingly to
> the specification, enabling it to be handled by the livepatch loader.
> 
> Given the above, add support for symbol mapping in the form of a
> symbols.klp file; add klp-convert tool; integrate klp-convert tool into
> kbuild; make livepatch modules discernible during kernel compilation
> pipeline; add data-structure and macros to enable users to annotate
> livepatch source code; make modpost stage compatible with livepatches;
> update livepatch-sample and update documentation.
> 
> The patch was tested under three use-cases:
> 
> use-case 1: There is a relocation in the lp that can be automatically
> resolved by klp-convert.  For example. see the saved_command_line
> variable in lib/livepatch/test_klp_convert2.c.
> 
> use-case 2: There is a relocation in the lp that cannot be automatically
> resolved, as the name of the respective symbol appears in multiple
> objects. The livepatch contains an annotation to enable a correct
> relocation.  See the KLP_MODULE_RELOC / KLP_SYMPOS annotation sections
> in lib/livepatch/test_klp_convert{1,2}.c.
> 
> use-case 3: There is a relocation in the lp that cannot be automatically
> resolved similarly as 2, but no annotation was provided in the
> livepatch, triggering an error during compilation.  Reproducible by
> removing the KLP_MODULE_RELOC / KLP_SYMPOS annotation sections in
> lib/livepatch/test_klp_convert{1,2}.c.
> 
> Selftests have been added to exercise these klp-convert use-cases
> through several tests.
> 
> 
> Testing
> -------
> 
> The patchset selftests build and execute on x86_64, s390x, and ppc64le
> for both default config (with added livepatch dependencies) and a larger
> RHEL-9-ish config.
> 
> Using the Intel's Linux Kernel Performance tests's make.cross,
> klp-convert builds and processes livepatch .ko's for x86_64 ppc64le
> ppc32 s390 arm64 arches.
> 
> 
> Summary of changes in v7
> ------------------------
> 
> - rebase for v6.2
> - combine ("livepatch: Add klp-convert tool") with ("livepatch: Add
>   klp-convert annotation helpers")
> - combine ("kbuild: Support for symbols.klp creation") with ("modpost:
>   Integrate klp-convert") to simplify Kbuild magic [Petr, Nicolas]
> - klp-convert: add safe_snprintf() (-Wsign-compare)
> - klp-convert: fix -Wsign-compare warnings
> - klp-convert: use calloc() where appropriate
> - klp-convert: copy ELF e_flags
> - selftests: fix various build warnings
> - klp-convert: WARN msg simplification, failed sanity checks, and sympos
>   comment [Marcos]
> - klp-convert: fix elf_write_file() error paths [Petr]

Thanks for the new version Joe. I've run the ksefltests on my x86 laptop, and it
succeed as expected, so

Tested-by: Marcos Paulo de Souza <mpdesouza@suse.com>

> 
> 
> Previous versions
> -----------------
> 
> RFC:
>   https://lore.kernel.org/lkml/cover.1477578530.git.jpoimboe@redhat.com/
> v2:
>   https://lore.kernel.org/lkml/f52d29f7-7d1b-ad3d-050b-a9fa8878faf2@redhat.com/
> v3:
>   https://lore.kernel.org/lkml/20190410155058.9437-1-joe.lawrence@redhat.com/
> v4:
>   https://lore.kernel.org/lkml/20190509143859.9050-1-joe.lawrence@redhat.com/
> v5:
>   (not posted)
>   https://github.com/joe-lawrence/klp-convert-tree/tree/klp-convert-v5-devel
> v6:
>   https://lore.kernel.org/live-patching/20220216163940.228309-1-joe.lawrence@redhat.com/
> 
> 
> Joe Lawrence (10):
>   livepatch: Create and include UAPI headers
>   livepatch: Add klp-convert tool
>   kbuild/modpost: create symbols.klp and integrate klp-convert
>   livepatch: Add sample livepatch module
>   documentation: Update on livepatch elf format
>   livepatch/selftests: add klp-convert
>   livepatch/selftests: test multiple sections
>   livepatch/selftests: add __asm__ symbol renaming examples
>   livepatch/selftests: add data relocations test
>   livepatch/selftests: add static keys test
> 
>  .gitignore                                    |   2 +
>  Documentation/dontdiff                        |   1 +
>  Documentation/livepatch/livepatch.rst         |   3 +
>  Documentation/livepatch/module-elf-format.rst |  42 +-
>  MAINTAINERS                                   |   2 +
>  Makefile                                      |  16 +-
>  include/linux/livepatch.h                     |  13 +
>  include/uapi/linux/livepatch.h                |  25 +
>  kernel/livepatch/core.c                       |   4 +-
>  lib/livepatch/Makefile                        |  12 +
>  lib/livepatch/test_klp_convert.h              |  45 +
>  lib/livepatch/test_klp_convert1.c             | 121 +++
>  lib/livepatch/test_klp_convert2.c             | 110 +++
>  lib/livepatch/test_klp_convert_data.c         | 190 ++++
>  lib/livepatch/test_klp_convert_keys.c         |  91 ++
>  lib/livepatch/test_klp_convert_keys_mod.c     |  52 +
>  lib/livepatch/test_klp_convert_mod_a.c        |  31 +
>  lib/livepatch/test_klp_convert_mod_b.c        |  19 +
>  lib/livepatch/test_klp_convert_mod_c.c        |  36 +
>  lib/livepatch/test_klp_convert_sections.c     | 120 +++
>  samples/livepatch/Makefile                    |   1 +
>  .../livepatch/livepatch-annotated-sample.c    |  93 ++
>  scripts/Makefile                              |   1 +
>  scripts/Makefile.modfinal                     |  33 +
>  scripts/Makefile.modpost                      |   5 +
>  scripts/livepatch/.gitignore                  |   1 +
>  scripts/livepatch/Makefile                    |   5 +
>  scripts/livepatch/elf.c                       | 817 ++++++++++++++++
>  scripts/livepatch/elf.h                       |  74 ++
>  scripts/livepatch/klp-convert.c               | 893 ++++++++++++++++++
>  scripts/livepatch/klp-convert.h               |  47 +
>  scripts/livepatch/list.h                      | 391 ++++++++
>  scripts/mod/modpost.c                         |  28 +-
>  scripts/mod/modpost.h                         |   1 +
>  .../selftests/livepatch/test-livepatch.sh     | 403 ++++++++
>  35 files changed, 3716 insertions(+), 12 deletions(-)
>  create mode 100644 include/uapi/linux/livepatch.h
>  create mode 100644 lib/livepatch/test_klp_convert.h
>  create mode 100644 lib/livepatch/test_klp_convert1.c
>  create mode 100644 lib/livepatch/test_klp_convert2.c
>  create mode 100644 lib/livepatch/test_klp_convert_data.c
>  create mode 100644 lib/livepatch/test_klp_convert_keys.c
>  create mode 100644 lib/livepatch/test_klp_convert_keys_mod.c
>  create mode 100644 lib/livepatch/test_klp_convert_mod_a.c
>  create mode 100644 lib/livepatch/test_klp_convert_mod_b.c
>  create mode 100644 lib/livepatch/test_klp_convert_mod_c.c
>  create mode 100644 lib/livepatch/test_klp_convert_sections.c
>  create mode 100644 samples/livepatch/livepatch-annotated-sample.c
>  create mode 100644 scripts/livepatch/.gitignore
>  create mode 100644 scripts/livepatch/Makefile
>  create mode 100644 scripts/livepatch/elf.c
>  create mode 100644 scripts/livepatch/elf.h
>  create mode 100644 scripts/livepatch/klp-convert.c
>  create mode 100644 scripts/livepatch/klp-convert.h
>  create mode 100644 scripts/livepatch/list.h
> 
> -- 
> 2.39.2
> 
