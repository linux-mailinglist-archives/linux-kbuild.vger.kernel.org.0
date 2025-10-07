Return-Path: <linux-kbuild+bounces-9042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D0BC2931
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 21:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7FC219A31FA
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 20:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CE019CC0C;
	Tue,  7 Oct 2025 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RWWYV9Y8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EDD1DE4FB
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Oct 2025 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867189; cv=none; b=uzjFUCSUXgYLQmllOVgzsU+3uyeu1LzwZO94oMJweXdw9XZCr9vrvcTOceVeBKZKDipgPeZCzXxl3e7NuYKt7TdvmWIYl0nBStrXUpHu6nueMbNZVPdDs3hBtn+UZI0UsHH1yzoR85TKoGrSqgNF83ewaZo+PgGN9HQkHbLjarY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867189; c=relaxed/simple;
	bh=rk1Kb3CPtSyeXbHkCdcgWIJGlpngMZ+yO4pxRdE07WU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmzBDt6XLAvEsHnVsJAldDYGxYPK6E9+BECamX0rMBD6xsNBeU92Hag87f1dHJPQgH74Y6JwgYsyWQgLjd+y94Jsps2H7B8ut72LQTZ9D24QfDpsT4EjCmywVj9qwhB1CtqYqEiDacasTDE4bofHUI9oeMFwfaS8w69CRwcZkGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RWWYV9Y8; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5523142df73so4747130e0c.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Oct 2025 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759867187; x=1760471987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKAL20SuYyk1RCMv+7lcgOY/WApc/8rEx2dB4DPPLbc=;
        b=RWWYV9Y8qiosLX2oYb2KK9sjGl2ou99IRYEAnOJFDMCNebU+nPLlWkbGFYvhVG7yez
         2aLQcVPXq0UN3GqdkUsakeFkUppDmtlupIocNGVMDMgu3/XnA04HNmUE7kF2NQOhK9sd
         qlt+mJllN3+ZDUW9jUoTxRBnBUaW+CJyazm9HR64Wfvw7rFOMDXl+ReBwzpIUT9FfQLU
         qJwTuIFUxmGsEz5khHevhRuqqkA3dT6Aj3YXqxNb/8VqFOnXWOH+tV7Ottqg3t+sq5/V
         N3B87DRSaLD3xVXWh42vtth/OpLN6XShILbPA/YyTH/MecQ69eCrLAojdaqWtNT5ojMF
         2stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867187; x=1760471987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKAL20SuYyk1RCMv+7lcgOY/WApc/8rEx2dB4DPPLbc=;
        b=HV1PWwNiUGNdk10FGyHVwr3p7XfgoVZrdyx95Za66aKyxQe6h+bAzs2x5liQxqWGQS
         tDehqQ2TSWnDZhHdRfBWfRJ4W1Z3tOwN00cRPwqe3KDLceerL4irJf7HiFiD/c7wxnvA
         tI1tCKwasXd2GxpbRrAU1/dqrVBfDaQFHsaJce/HdXlVeEoe7RVvr2/fRIG7KwcJOfyQ
         1Vvzy0fEmWP0PysAdu4H6SVrroVgUsz92cmhue2jUbBJg6PFMW2lZAp8IQusJBj0PlBj
         7nh15h96g6aphENz5iO+YwzgKHOaJ9MwiGNXNpMGz1/RlGD9Ln0ybD2QNeji5VrPgqMy
         pfJg==
X-Forwarded-Encrypted: i=1; AJvYcCWAcLv3Xl6niPnRS9bOA0TfvoWoODnLf1aV0pzM3BEea74cw76TQk43LOwSIVKmDEgXb0jUswi/DDOicMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Ul5le276ocfF6lzbDrXzP9iUoPbHniVYcuqZWR0ce3IW//e+
	NpKNOEZ56wq89JKAgUeN5f3doQV0hnzVZvrlUk/x16fQM61XK/wfvkove1aYX6ttW4a3xpOjtDs
	A8HKqFKTmbVaBJWuLPmbQBeLxah4Kqjl/LY9YIIOK
X-Gm-Gg: ASbGncvoEMiT0Cli6cCRolWWwIeynK5yBUGKoOn1BIHofLsoMrkRK4bFQHap+OtTLe5
	TD+TsdJHcxeMQ7/45R7VlrPBvHCuVPyClKS23BYwyl+35DB2HE+AYI3fwBI4Eazb1RKI2QHffTz
	yDXJ1VvWcK7N38SP+1o3CityAqBJpre2EhAdyaz667Y8Xd5v/6eFjp8SPk8S6zpTEDTlFb/tIQG
	swRIaf3eVvyzxdWEt/D5VBRKkDzWt8K9oEFhVkCbmE0SwBYU26f8Ik+7p6rA6qMhgpodViCtr/n
	dQ==
X-Google-Smtp-Source: AGHT+IF6YwRb1B8achDa0fRUKkP6Z81GBRMaD7rwLgsvvOwW9BLQEwZ79OsWqR4oe8nrdA4pGoirFbVy43yd2aDbFG0=
X-Received: by 2002:a05:6122:20a3:b0:543:e262:ade2 with SMTP id
 71dfb90a1353d-554b8bdee12mr453098e0c.12.1759867186474; Tue, 07 Oct 2025
 12:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007024527.1439747-1-patso@likewhatevs.io> <be6kxu36uphlnhedsi7gsayhuetmqixil4dv2lxe4plvgyqewx@jecdpummb52l>
In-Reply-To: <be6kxu36uphlnhedsi7gsayhuetmqixil4dv2lxe4plvgyqewx@jecdpummb52l>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 7 Oct 2025 12:59:34 -0700
X-Gm-Features: AS18NWBJd7rY2qG2exN7NwwFc5oLXYLDbh9LGcL9vMHlkSU3-5jP4hsQGfwMDDc
Message-ID: <CAFhGd8quQ3i9wEGOJNxy5s_MuD=WdxwqL15qB1i=KY8fW1Cf_Q@mail.gmail.com>
Subject: Re: [PATCH] scripts/clang-tools: Handle included .c files in gen_compile_commands
To: Pat Somaru <patso@likewhatevs.io>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I seem to have dropped some folks from the CC list somehow (probably
wrong mutt keybind).

I've self-quoted myself below to preserve context.

On Tue, Oct 7, 2025 at 12:55=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Mon, Oct 06, 2025 at 10:45:27PM -0400, Pat Somaru wrote:
> > The gen_compile_commands.py script currently only creates entries for t=
he
> > primary source files found in .cmd files, but some kernel source files
> > text-include others (i.e. kernel/sched/build_policy.c).
> >
> > This prevents tools like clangd from working properly on text-included =
c
> > files, such as kernel/sched/ext.c because the generated compile_command=
s.json
> > does not have entries for them.
> >
> > Extend process_line() to detect when a source file includes .c files, a=
nd
> > generate additional compile_commands.json entries for them. For include=
d c
> > files, use the same compile flags as their parent and add their parents=
 headers.
> >
> > This enables lsp tools like clangd to work properly on files like
> > kernel/sched/ext.c
> >
> > Signed-off-by: Pat Somaru <patso@likewhatevs.io>
>
> FWIW, I tested this out and my clangd was much happier dealing with
> kernel/sched/ext.c. Nathan's points are still valid, I'm just giving
> user feedback.
>
> After benchmarking the script itself, I saw some performance hits:
>
> pre-patch, 5x run average: 0.590 seconds
> post-patch, 5x run average: 2.164 seconds
>
> With this simple invocation:
>
>   ./scripts/clang-tools/gen_compile_commands.py -d build-master -o $TMP/c=
ompile_commands.json
>
> I realize this script is not ran often but maybe there is some heurstic
> or speedup that can be made to the regex.
>
> Tested-by: Justin Stitt <justinstitt@google.com>
>
> > ---
> >  scripts/clang-tools/gen_compile_commands.py | 126 +++++++++++++++++++-
> >  1 file changed, 121 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clan=
g-tools/gen_compile_commands.py
> > index 96e6e46ad1a70..02791efdc06d0 100755
> > --- a/scripts/clang-tools/gen_compile_commands.py
> > +++ b/scripts/clang-tools/gen_compile_commands.py
> > @@ -149,8 +149,87 @@ def cmdfiles_for_modorder(modorder):
> >                      yield to_cmdfile(mod_line.rstrip())
> >
> >
> > +def extract_includes_from_file(source_file, root_directory):
> > +    """Extract #include statements from a C file.
> > +
> > +    Args:
> > +        source_file: Path to the source .c file to analyze
> > +        root_directory: Root directory for resolving relative paths
> > +
> > +    Returns:
> > +        List of header files that should be included (without quotes/b=
rackets)
> > +    """
> > +    includes =3D []
> > +    if not os.path.exists(source_file):
> > +        return includes
> > +
> > +    try:
> > +        with open(source_file, 'r') as f:
> > +            for line in f:
> > +                line =3D line.strip()
> > +                # Look for #include statements.
> > +                # Match both #include "header.h" and #include <header.=
h>.
> > +                match =3D re.match(r'^\s*#\s*include\s*[<"]([^>"]*)[>"=
]', line)
> > +                if match:
> > +                    header =3D match.group(1)
> > +                    # Skip including other .c files to avoid circular =
includes.
> > +                    if not header.endswith('.c'):
> > +                        # For relative includes (quoted), resolve path=
 relative to source file.
> > +                        if '"' in line:
> > +                            src_dir =3D os.path.dirname(source_file)
> > +                            header_path =3D os.path.join(src_dir, head=
er)
> > +                            if os.path.exists(header_path):
> > +                                rel_header =3D os.path.relpath(header_=
path, root_directory)
> > +                                includes.append(rel_header)
> > +                            else:
> > +                                includes.append(header)
> > +                        else:
> > +                            # System include like <linux/sched.h>.
> > +                            includes.append(header)
> > +    except IOError:
> > +        pass
> > +
> > +    return includes
> > +
> > +
> > +def find_included_c_files(source_file, root_directory):
> > +    """Find .c files that are included by the given source file.
> > +
> > +    Args:
> > +        source_file: Path to the source .c file
> > +        root_directory: Root directory for resolving relative paths
> > +
> > +    Yields:
> > +        Full paths to included .c files
> > +    """
> > +    if not os.path.exists(source_file):
> > +        return
> > +
> > +    try:
> > +        with open(source_file, 'r') as f:
> > +            for line in f:
> > +                line =3D line.strip()
> > +                # Look for #include "*.c" patterns.
> > +                match =3D re.match(r'^\s*#\s*include\s*"([^"]*\.c)"\s*=
$', line)
> > +                if match:
> > +                    included_file =3D match.group(1)
> > +                    # Handle relative paths.
> > +                    if not os.path.isabs(included_file):
> > +                        src_dir =3D os.path.dirname(source_file)
> > +                        included_file =3D os.path.join(src_dir, includ=
ed_file)
> > +
> > +                    # Normalize the path.
> > +                    included_file =3D os.path.normpath(included_file)
> > +
> > +                    # Check if the file exists.
> > +                    if os.path.exists(included_file):
> > +                        yield included_file
> > +    except IOError:
> > +        pass
> > +
> > +
> >  def process_line(root_directory, command_prefix, file_path):
> > -    """Extracts information from a .cmd line and creates an entry from=
 it.
> > +    """Extracts information from a .cmd line and creates entries from =
it.
> >
> >      Args:
> >          root_directory: The directory that was searched for .cmd files=
. Usually
> > @@ -160,7 +239,8 @@ def process_line(root_directory, command_prefix, fi=
le_path):
> >              Usually relative to root_directory, but sometimes absolute=
.
> >
> >      Returns:
> > -        An entry to append to compile_commands.
> > +        A list of entries to append to compile_commands (may include m=
ultiple
> > +        entries if the source file includes other .c files).
> >
> >      Raises:
> >          ValueError: Could not find the extracted file based on file_pa=
th and
> > @@ -176,11 +256,47 @@ def process_line(root_directory, command_prefix, =
file_path):
> >      abs_path =3D os.path.realpath(os.path.join(root_directory, file_pa=
th))
> >      if not os.path.exists(abs_path):
> >          raise ValueError('File %s not found' % abs_path)
> > -    return {
> > +
> > +    entries =3D []
> > +
> > +    # Create entry for the main source file.
> > +    main_entry =3D {
> >          'directory': root_directory,
> >          'file': abs_path,
> >          'command': prefix + file_path,
> >      }
> > +    entries.append(main_entry)
> > +
> > +    # Find and create entries for included .c files.
> > +    for included_c_file in find_included_c_files(abs_path, root_direct=
ory):
> > +        # For included .c files, create a compilation command that:
> > +        # 1. Uses the same compilation flags as the parent file
> > +        # 2. But compiles the included file directly (not the parent)
> > +        # 3. Includes necessary headers from the parent file for prope=
r macro resolution
> > +
> > +        # Convert absolute path to relative for the command.
> > +        rel_path =3D os.path.relpath(included_c_file, root_directory)
> > +
> > +        # Extract includes from the parent file to provide proper comp=
ilation context.
> > +        extra_includes =3D ''
> > +        try:
> > +            parent_includes =3D extract_includes_from_file(abs_path, r=
oot_directory)
> > +            if parent_includes:
> > +                extra_includes =3D ' ' + ' '.join('-include ' + inc fo=
r inc in parent_includes)
> > +        except IOError:
> > +            pass
> > +
> > +        included_entry =3D {
> > +            'directory': root_directory,
> > +            'file': included_c_file,
> > +            # Use the same compilation prefix but target the included =
file directly.
> > +            # Add extra headers for proper macro resolution.
> > +            'command': prefix + extra_includes + ' ' + rel_path,
> > +        }
> > +        entries.append(included_entry)
> > +        logging.debug('Added entry for included file: %s', included_c_=
file)
> > +
> > +    return entries
> >
> >
> >  def main():
> > @@ -213,9 +329,9 @@ def main():
> >                  result =3D line_matcher.match(f.readline())
> >                  if result:
> >                      try:
> > -                        entry =3D process_line(directory, result.group=
('command_prefix'),
> > +                        entries =3D process_line(directory, result.gro=
up('command_prefix'),
> >                                               result.group('file_path')=
)
> > -                        compile_commands.append(entry)
> > +                        compile_commands.extend(entries)
> >                      except ValueError as err:
> >                          logging.info('Could not add line from %s: %s',
> >                                       cmdfile, err)
> > --
> > 2.51.0
> >
> >
>
> Thanks
> Justin

